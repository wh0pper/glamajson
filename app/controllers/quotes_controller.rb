class QuotesController < ApplicationController
  include Response

  def index
    @quotes = Quote.all
    json_response(@quotes, :ok)
  end

  def show
    @quote = Quote.find(params[:id])
    json_response(@quote, :ok)
  end

  def create
    @quote = Quote.create!(quote_params)
    json_response(@quote, :created)
  end

  def update
    @quote = Quote.find(params[:id])
    if @quote.update!(quote_params)
      render status: 200, json: {
        message: "Quote successfully updated."
      }
  end

  def destroy
    @quote = Quote.find(params[:id])
    if @quote.destroy!
      render status: 200, json: {
        message: "Quote successfully destroyed."
      }
  end

  private
  def quote_params
    params.permit(:author, :content)
  end
end