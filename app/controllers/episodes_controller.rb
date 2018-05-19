class EpisodesController < ApplicationController
  include Response

  def index
    if season_id = params[:season_id]
      @episodes = Season.find(season_id).episodes
    else
      @episodes = Episode.all
    end
    json_response(@episodes, nil, :ok)
  end

  def show
    @episode = Episode.find(params[:id])
    json_response(@episode, nil, :ok)
  end

end
