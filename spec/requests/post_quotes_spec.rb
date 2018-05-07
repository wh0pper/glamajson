require 'rails_helper'

describe "post a quote route", :type => :request do

  before { post '/quotes', params: { author: "LaGanja Estranja", content: "I feel very attacked!"} }

  it 'returns the author name' do
    expect(JSON.parse(response.body)['author']).to eq('LaGanja Estranja')
  end

  it 'returns the quote content' do
    expect(JSON.parse(response.body)['content']).to eq('I feel very attacked!')
  end

  it 'returns a created status' do
    expect(response).to have_http_status(:created)
  end
end
