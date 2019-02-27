require 'rails_helper'

describe "Backgrounds Controller", :vcr do
  it "pull in background" do
    create(:user, api_key: "1234")

    get '/api/v1/backgrounds?location=denver,co'

    parsed_response = JSON.parse(response.body)

    expect(response.status).to eq(202)
    expect(parsed_response).to have_key("default_image")
  end
end
