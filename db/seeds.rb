require 'erb'

class Seed
  def self.begin
    seed = Seed.new
    # seed.generate_quotes
    # seed.scrape_queens
    seed.get_queen_details
  end

  # def generate_quotes
  #   Quote.destroy_all
  #   20.times do |i|
  #     quote = Quote.create!(
  #       author: Faker::RuPaul.queen,
  #       content: Faker::RuPaul.quote
  #     )
  #   end
  #   puts "Generated #{Quote.all.length} quotes"
  # end

  def scrape_queens
    Season.destroy_all
    Queen.destroy_all
    10.times do |i|
      uri = "http://rupaulsdragrace.wikia.com/wiki/Category:Season_#{i+1}_Queens"
      queens = Nokogiri::HTML(open(uri)).xpath('//div[contains(@class, "title")]')
      season = Season.create!(name: "Season #{i+1}")
      queens.each do |queen|
        unless (queen.text == "Category page") || (queen.text == "Transgender Queens")
          season.queens.create!(name: queen.text)
        end
      end
    end
  end

  def get_queen_details
    Queen.all.each do |queen|
      uri = "http://rupaulsdragrace.wikia.com/wiki/#{ERB::Util.url_encode(queen.name)}"
      if page = Nokogiri::HTML(open(uri))
        queen.update!(
          real_name: page.xpath("//div[contains(@class, 'pi-item pi-data')]/div")[1].text,
          age: page.xpath("//div[contains(@class, 'pi-item pi-data')]/div")[3].text,
          city: page.xpath("//div[contains(@class, 'pi-item pi-data')]/div")[5].text
        )
      end  
    end
  end
end

Seed.begin
