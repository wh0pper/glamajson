class QueensController < ApplicationController
  include Response

  def index
    @queens = Queen.all
    json_response(@queens, :ok)
  end

  def show
    @queen = Queen.find(params[:id])
    json_response(@queen, :ok)
  end

  def create
    @queen = Queen.create!(queen_params)
    json_response(@queen, :created)
  end

  def update
    @queen = Queen.find(params[:id])
    if @queen.update!(queen_params)
      render status: 200, json: {
        message: "Queen successfully updated."
      }
    end
  end

  def destroy
    @queen = Queen.find(params[:id])
    if @queen.destroy!
      render status: 200, json: {
        message: "Queen successfully destroyed."
      }
    end
  end

  private
  def queen_params
    params.permit(:name, :real_name, :city, :age)
  end
end
