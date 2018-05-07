require 'rails_helper'

describe "post a queen route", :type => :request do

  before { post '/queens', params: { name: "LaGanja Estranja" } }

  it 'returns the author name' do
    expect(JSON.parse(response.body)['name']).to eq('LaGanja Estranja')
  end

  it 'returns a created status' do
    expect(response).to have_http_status(:created)
  end
end
