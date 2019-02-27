require 'rails_helper'

describe "Favorites" do
  it "can be deleted" do
    create(:user, api_key: "1234")
    create(:favorite, location: "Denver, CO", api_key: "1234")
    create(:favorite, location: "Boston, MA", api_key: "1234")
    create(:favorite, location: "San Fran, CA", api_key: "1234")

    params = {
              "location": "Denver, CO",
              "api_key": "1234"
              }

    delete api_v1_favorites_path(params)
    parsed_response = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(parsed_response["body"]).to eq("Favorite Deleted")
  end

  it "errors out if not delete" do
    create(:user, api_key: "1234")
    create(:favorite, location: "Denver, CO", api_key: "1234")
    create(:favorite, location: "Boston, MA", api_key: "1234")
    create(:favorite, location: "San Fran, CA", api_key: "1234")

    params = {
              "location": "Denver, CO",
              "api_key": "5678"
              }

    delete api_v1_favorites_path(params)

    expect(response.status).to eq(401)
  end
end
