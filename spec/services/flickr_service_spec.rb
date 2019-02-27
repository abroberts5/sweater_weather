require 'rails_helper'

describe "Flickr Service" do
  before(:each) do
    lat = 39.7392
    lng = -104.9903
    @flickr = FlickrService.new(lat, lng)
  end
  it 'exists' do
    expect(@flickr).to be_a(FlickrService)
  end

  it 'can return relevant photo for location', :vcr do

    expect(@flickr.random.first).to have_key("title")
    expect(@flickr.random.first).to have_key("id")
  end
end
