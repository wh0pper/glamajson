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
    @episide = Episode.find(params[:id])
    json_response(@episode, nil, :ok)
  end
  #
  # def create
  #   @quote = Quote.create!(quote_params)
  #   json_response(d@quote, :created)
  # end
  #
  # def update
  #   @quote = Quote.find(params[:id])
  #   if @quote.update!(quote_params)
  #     render status: 200, json: {
  #       message: "Quote successfully updated."
  #     }
  #   end
  # end
  #
  # def destroy
  #   @quote = Quote.find(params[:id])
  #   if @quote.destroy!
  #     render status: 200, json: {
  #       message: "Quote successfully destroyed."
  #     }
  #   end
  # end

  # private
  # def quote_params
  #   params.permit(:author, :content)
  # end
end
