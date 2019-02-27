require 'rails_helper'

describe "Favorites Controller" do
  it "can store favorites" do
    create(:user, api_key: "1234")

    params = {
              "location": "Denver, CO",
              "api_key": "1234"
              }

    post api_v1_favorites_path(params)

    parsed_response = JSON.parse(response.body)

    expect(response.status).to eq(201)
    expect(Favorite.all.count).to eq(1)
    expect(parsed_response["api_key"]).to eq("1234")
    expect(parsed_response["location"]).to eq("Denver, CO")
  end

  it "shows error with not created" do
    create(:user)

    params = {
              "location": "Denver, CO",
              "api_key": "1234"
              }

    post api_v1_favorites_path(params)
    parsed_response = JSON.parse(response.body)

    expect(response.status).to eq(401)
    expect(parsed_response).to have_key("error")
  end

  it "lists favorites and returns location and weather", :vcr do
    create(:user, api_key: "5678")
    create(:favorite, api_key: "5678")
    create(:favorite, api_key: "5678")
    create(:favorite, api_key: "5678")

    params = {
            "api_key": "5678"
            }

    get api_v1_favorites_path(params)

    parsed_response = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(200)

    expect(parsed_response[:body].first).to have_key(:location)
    expect(parsed_response[:body].first).to have_key(:current_weather)
    expect(parsed_response[:body].first[:current_weather]).to have_key(:summary)
    expect(parsed_response[:body].first[:current_weather]).to have_key(:icon)
    expect(parsed_response[:body].first[:current_weather]).to have_key(:temp)
  end

  it "favorites list errors out without correct api key", :vcr do
    create(:user)
    create(:favorite, api_key: "1234")

    params = {
            "api_key": "jgn983hy48thw9begh98h4539h4"
            }

    get api_v1_favorites_path(params)

    expect(response.status).to eq(401)
  end
end
