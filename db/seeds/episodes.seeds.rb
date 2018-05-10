Episode.destroy_all


10.times do |i|
  season = Season.where(name: "Season #{i+1}").first
  uri = "https://en.wikipedia.org/wiki/RuPaul%27s_Drag_Race_(season_#{i+1})"
  episode_rows = Nokogiri::HTML(open(uri)).xpath("//table[contains(@class,'wikiepisodetable')]/tr[position()>1]")
  episode_rows.each_slice(2) do |episode|
    season.episodes.create!(
      number_in_series: episode[0].xpath("./th").text,
      number_in_season: episode[0].xpath("./td[1]").text,
      title: episode[0].xpath("./td[2]").text.gsub(/"/, ""),
      airdate: episode[0].xpath("./td[3]").text,
      bottom_two: episode[1].xpath(".//ul/li[contains(.,'Bottom Two')]").text.gsub(/.+?(: )/, ""),
      eliminated: episode[1].xpath(".//ul/li[contains(.,'Eliminated')]").text.gsub(/.+?(: )/, ""),
      winner: episode[1].xpath(".//ul/li[contains(.,'Challenge Winner')]").text.gsub(/.+?(: )/, ""),
      lip_synch: episode[1].xpath(".//ul/li[contains(.,'Lip')]").text.gsub(/.+?(: )/, "").gsub(/"/, "")
    )
  end
end

puts "Found #{Episode.all.length} episodes"
