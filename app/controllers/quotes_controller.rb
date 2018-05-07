class QuotesController < ApplicationController
  def index
    @quotes = {"quotation": "That's Funny, Tell Another One"}
    json_response(@quotes)
  end

  private
  def json_response(object)
    render json: object, status: :ok
  end
end 
