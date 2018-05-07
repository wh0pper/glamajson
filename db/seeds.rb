class Seed
  def self.begin
    seed = Seed.new
    # seed.generate_quotes
    seed.scrape_queens
  end

  def generate_quotes
    Quote.destroy_all
    20.times do |i|
      quote = Quote.create!(
        author: Faker::RuPaul.queen,
        content: Faker::RuPaul.quote
      )
    end
    puts "Generated #{Quote.all.length} quotes"
  end

  def scrape_queens
    Season.destroy_all
    Queen.destroy_all
    5.times do |i|
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
end

Seed.begin
