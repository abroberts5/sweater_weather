  require 'rails_helper'

describe "Gif Forecast Model" do
  it 'can forward 5 different times', :vcr do
    location = "denver,co"

    gif_forecast = GifForecast.new(location)

    expect(gif_forecast.updated_forecast[:data][:images].size).to eq(5)
    expect(gif_forecast.updated_forecast[:data][:images].first).to have_key(:time)
    expect(gif_forecast.updated_forecast[:data][:images].first).to have_key(:summary)
    expect(gif_forecast.updated_forecast[:data][:images].first).to have_key(:url)
  end
end
