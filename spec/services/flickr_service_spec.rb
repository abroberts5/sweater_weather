require 'rails_helper'

describe "Flickr Service" do
  before(:each) do
    location = "denver,co"
    @flickr = FlickrService.new(location)
  end
  it 'exists' do
    expect(@flickr).to be_a(FlickrService)
  end

  it 'can return relevant photo for location', :vcr do

    expect(@flickr.random).to have_key("title")
    expect(@flickr.random).to have_key("id")
  end
end
