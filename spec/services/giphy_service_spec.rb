require 'rails_helper'

describe "Giphy Service" do
  before(:each) do
    @giphy = GiphyService.new
  end
  it 'exists' do
    expect(@giphy).to be_a(GiphyService)
  end

  it 'can search for relevant params', :vcr do

    expect(@giphy.search("grey day").first).to have_key(:url)
    expect(@giphy.search("grey day").first).to have_key(:rating)
  end
end
