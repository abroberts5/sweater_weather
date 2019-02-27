require 'rails_helper'

describe "Session Controller" do
  it "creates has session with response" do
    user = create(:user)

    post api_v1_sessions_path({"email": user.email,
                          "password": user.password
                          })

    parsed_response = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(parsed_response).to have_key("api_key")
  end

  it "errors out when not created with credentials" do
   create(:user)

    post api_v1_sessions_path({"email": "whatever@example.com",
                          "password": "password"
                          })

    expect(response.status).to eq(401)
  end
end
