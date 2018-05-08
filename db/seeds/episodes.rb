class EpisodeSeed
  def self.begin
    seed = EpisodeSeed.new
    seed.scrape_basics
  end

  def scrape_basics
    Episode.destroy_all
  end
end

EpisodeSeed.begin
