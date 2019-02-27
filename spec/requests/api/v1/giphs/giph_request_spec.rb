require 'rails_helper'

describe "Giph" do
  it 'can visit path and see info', :vcr do

    get '/api/v1/gifs?location=denver,co'

    a = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
  end
end
