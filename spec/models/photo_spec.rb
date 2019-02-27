require 'rails_helper'

describe "Photo Model" do
  it 'can call the flickr api', :vcr do
    location = "denver,co"
    photo = Photo.new(location)

    expect(photo.location).to eq("denver,co")
  end
end
