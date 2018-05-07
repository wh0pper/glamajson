FactoryBot.define do
  factory(:quote) do
    content(Faker::RuPaul.quote)
    author(Faker::RuPaul.queen)
  end
end
