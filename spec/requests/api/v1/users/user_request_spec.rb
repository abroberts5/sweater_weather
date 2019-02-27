require 'rails_helper'

describe "User Info" do
  it "can log in and create an account" do
    user = create(:user)

    post '/api/v1/users'

    expect(response).to be_successful

    expect(User.last).to eq(user)
    expect(User.last.email).to eq(user.email)
    expect(User.last.api_key).to eq(user.api_key)
  end
end
