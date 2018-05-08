
    Episode.destroy_all
    10.times do |i|
      uri = "http://rupaulsdragrace.wikia.com/wiki/RuPaul%27s_Drag_Race_(Season_#{i+1})"
      episodes_table = Nokogiri::HTML(open(uri)).xpath("//span[contains(., 'Episodes')]/ancestor::h2/following-sibling::table[1]")
      season = Season.where(name: "Season #{i+1}")
      episodes_table.xpath('.//tr[position()>1]').each do |row|
        binding.pry
        # season.episodes.create!(
        #
        # )
      end
    end
