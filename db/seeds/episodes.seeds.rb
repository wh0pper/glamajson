
    Episode.destroy_all
    10.times do |i|
      uri = "http://rupaulsdragrace.wikia.com/wiki/RuPaul%27s_Drag_Race_(Season_#{i+1})"
      episodes_table = Nokogiri::HTML(open(uri)).xpath("//span[contains(., 'Episodes')]/ancestor::h2/following-sibling::table[1]")
      season = Season.where(name: "Season #{i+1}").first
      episodes_table.xpath('.//tr[position()>1]').each do |row|
        season.episodes.create!(
          number_in_series: row.xpath('./td[1]').text,
          number_in_season: row.xpath('./td[2]').text,
          title: row.xpath('./td[3]').text,
          airdate: row.xpath('./td[4]').text,
        )
      end
    end
