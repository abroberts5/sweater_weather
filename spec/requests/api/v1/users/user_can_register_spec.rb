require 'rails_helper'

describe "User Registration" do
  it "can register an account" do
    user = create(:user)

    post api_v1_users_path({"email": "whatever@example.com",
                        "password": "password",
                        "password_confirmation": "password"})

    parsed_response = JSON.parse(response.body)

    expect(response).to be_successful
    expect(response.status).to eq(201)
    expect(parsed_response).to have_key("api_key")

    expect(User.first).to eq(user)
    expect(User.first.email).to eq(user.email)
    expect(User.first.api_key).to be_truthy
  end
  it "cant register an account with bad creds" do

    post api_v1_users_path({"email": "whatever@example.com",
                        "password": "password",
                        "password_confirmation": "potatoes"})

    expect(response.status).to eq(401)
  end
end
