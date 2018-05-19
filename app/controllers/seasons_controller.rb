class QueensController < ApplicationController
  include Response

  def index
    inclusions = nil
    if params[:quotes] == 'true'
      inclusions = :quotes
    end
    if params[:name]
      @queens = Queen.search_by_name(params[:name])
    elsif params[:winners]
      @queens = Queen.search_for_winners
    elsif params[:serial]
      @queens = Queen.search_for_serial
    else
      @queens = Queen.all
    end

    json_response(@queens, inclusions, :ok)
  end

  def show
    @queen = Queen.find(params[:id])
    json_response(@queen, nil, :ok)
  end

  def create
    @queen = Queen.create!(queen_params)
    json_response(@queen, nil, :created)
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
