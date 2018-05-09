require 'erb'

class QueenSeed
  def self.begin
    seed = QueenSeed.new
    seed.scrape_queens
    seed.get_queen_details
  end

  def scrape_queens
    Season.destroy_all
    Queen.destroy_all
    10.times do |i|
      uri = "http://rupaulsdragrace.wikia.com/wiki/Category:Season_#{i+1}_Queens"
      queens = Nokogiri::HTML(open(uri)).xpath('//div[contains(@class, "title")]')
      season = Season.create!(name: "Season #{i+1}")
      queens.each do |queen|
        unless (queen.text == "Category page") || (queen.text == "Transgender Queens") || (queen.text == "Bitter Old Lady Brigade")
          season.queens.create!(name: queen.text)
        end
      end
    end
    puts "Found #{Queen.all.length} queens"
  end

  def get_queen_details
    Queen.all.each do |queen|
      uri = "http://rupaulsdragrace.wikia.com/wiki/#{ERB::Util.url_encode(queen.name)}"
      begin
        page = Nokogiri::HTML(open(uri))
        if page != nil
          queen.update!(
            real_name: page.xpath("//h3[text()='Real Name']/following-sibling::div").text,
            age: page.xpath("//h3[text()='Age']/following-sibling::div").text,
            city: page.xpath("//h3[text()='Current City']/following-sibling::div").text
          )
          page.xpath("//span[contains(., 'Quotes')]/ancestor::h2/following-sibling::ul/li").first(5).each do |node|
            queen.quotes.create!(content: node.text.strip)
          end
        end
      rescue OpenURI::HTTPError => e
        if e.message == '404 Not Found'
          puts "Page not found for #{queen.name}"
        else
          raise e
        end
      end
    end
    puts "Gathered queen details"
  end
end

QueenSeed.begin
