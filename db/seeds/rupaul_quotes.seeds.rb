rupaul = Queen.create!(name: 'RuPaul Charles', real_name: 'RuPaul Charles', age: 57, city: "Los Angeles, CA")
Season.all.each do |s|
  s.queens << rupaul
end

20.times do |i|
  Quote.create!(content: Faker::RuPaul.quote)
end
puts "Generated #{Quote.all.length} quotes"
