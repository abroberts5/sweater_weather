require 'rails_helper'

describe "Forecast" do
  it 'can visit path and see info', :vcr do

    get '/api/v1/forecast?location=denver,co'
    a = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful

    expect(a[:data][:id]).to eq("39.7392358")
    expect(a[:data][:type]).to eq("forecast")
    expect(a[:data][:attributes][:city]).to eq("Denver")
    expect(a[:data][:attributes][:state]).to eq("CO")
    expect(a[:data][:attributes][:country]).to eq("US")
  end
end
