FactoryBot.define do
  factory(:quote) do
    content(Faker::RuPaul.quote)
    author(Faker::RuPaul.queen)
  end

  factory(:queen) do
    name(Faker::RuPaul.queen)
  end

  factory(:season) do
    name("Season #{rand(20).to_s}")
  end
end
