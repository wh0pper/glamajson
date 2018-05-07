require 'rails_helper'

describe "get all queens route", :type => :request do
  let!(:queens) { FactoryBot.create_list(:queen, 30) }

  before { get '/queens' }

  it 'returns all queens' do
    expect(JSON.parse(response.body).size).to eq(30)
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end
end
