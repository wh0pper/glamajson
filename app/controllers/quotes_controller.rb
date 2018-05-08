class QuotesController < ApplicationController
  include Response

  def index
    if queen = params[:queen]
      @quotes = Quote.search(queen)
    else
      @quotes = Quote.all
    end
    json_response(@quotes, nil, :ok)
  end

  def show
    @quote = Quote.find(params[:id])
    json_response(@quote, nil, :ok)
  end

  def create
    @quote = Quote.create!(quote_params)
    json_response(@quote, nil, :created)
  end

  def update
    @quote = Quote.find(params[:id])
    if @quote.update!(quote_params)
      render status: 200, json: {
        message: "Quote successfully updated."
      }
    end
  end

  def destroy
    @quote = Quote.find(params[:id])
    if @quote.destroy!
      render status: 200, json: {
        message: "Quote successfully destroyed."
      }
    end
  end

  private
  def quote_params
    params.permit(:author, :content)
  end
end
