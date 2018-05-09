Quote.destroy_all
20.times do |i|
  quote = Quote.create!(content: Faker::RuPaul.quote)
end
puts "Generated #{Quote.all.length} quotes"
