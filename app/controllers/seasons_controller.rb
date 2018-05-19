class SeasonsController < ApplicationController
  include Response

  def index
    inclusions = nil
    @seasons = Season.all
    json_response(@seasons, inclusions, :ok)
  end

  def show
    @season = Season.find(params[:id])
    json_response(@season, :episodes, :ok)
  end

end
