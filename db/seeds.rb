class Seed
  def self.begin
    seed = Seed.new
    seed.generate_quotes
  end

  def generate_quotes
    20.times do |i|
      quote = Quote.create!(
        author: Faker::RuPaul.queen,
        content: Faker::RuPaul.quote
      )
    end
    puts "Generated #{Quote.all.length} quotes"
  end
end

Seed.begin
