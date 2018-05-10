# Episode.destroy_all
# 10.times do |i|
#   uri = "http://rupaulsdragrace.wikia.com/wiki/RuPaul%27s_Drag_Race_(Season_#{i+1})"
#   episodes_table = Nokogiri::HTML(open(uri)).xpath("//span[contains(., 'Episodes')]/ancestor::h2/following-sibling::table[1]")
#   season = Season.where(name: "Season #{i+1}").first
#
#   episodes_table.xpath('.//tr[position()>2]').each do |row|
#     season.episodes.create!(
#       number_in_series: row.xpath('./td[1]').text,
#       number_in_season: row.xpath('./td[2]').text,
#       title: row.xpath('./td[3]').text.gsub(/\n/,''),
#       airdate: row.xpath('./td[4]').text.gsub(/\n/,'')
#     )
#   end
# end

#   # binding.pry
  # episode_lists = Nokogiri::HTML(open(uri)).xpath("//p[contains(.,'Summary')]/following-sibling::ul[contains(.,'Mini-Challenge')]")
  #
  # episode_lists.each_with_index do |ul, i|
  #   season.episodes.where(number_in_season: i+1).first.update!(
  #   bottom_two: ul.xpath("./li[contains(.,'Bottom Two')]").text.gsub("Bottom Two: ", "").gsub(/\n/,''),
  #   elimated: ul.xpath("./li[contains(.,'Eliminated')]").text.gsub("Eliminated: ", "").gsub(/\n/,''),
  #   winner: ul.xpath("./li[contains(.,'Challenge Winner')]").text.gsub("Challenge Winner: ", "").gsub(/\n/,''),
  #   lip_synch: ul.xpath("./li[contains(.,'Lip Synch Song')]").text.gsub("Lip Synch Song: ", "").gsub(/\n/,'')
  #   )
  #   binding.pry
  # end
# end

10.times do |i|
  season = Season.where(name: "Season #{i+1}").first
  uri = "https://en.wikipedia.org/wiki/RuPaul%27s_Drag_Race_(season_#{i+1})"
  episode_table = Nokogiri::HTML(open(uri)).xpath("//table[contains(@class,'wikiepisodetable')]")
  lists = episode_table.xpath(".//ul")
  lists
  puts i
  lists.each_with_index do |list, j|
    unless i == season.episodes.length-1
    season.episodes.where(number_in_season: j+1).first.update!(
      bottom_two: list.xpath("./li[contains(.,'Bottom Two')]").text.gsub("Bottom Two: ", "").gsub(/\n/,''),
      elimated: list.xpath("./li[contains(.,'Eliminated')]").text.gsub("Eliminated: ", "").gsub(/\n/,''),
      winner: list.xpath("./li[contains(.,'Challenge Winner')]").text.gsub("Challenge Winner: ", "").gsub(/\n/,''),
      lip_synch: list.xpath("./li[contains(.,'Lip-sync Song')]").text.gsub("Lip-sync Song: ", "").gsub(/\n/,'')
    )
  end
end

puts "Found #{Episode.all.length} episodes"
