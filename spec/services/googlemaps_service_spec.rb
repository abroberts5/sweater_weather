require 'rails_helper'

describe 'GoogleMapPlatform Service' do
  it 'exists' do
    google = GoogleService.new

    expect(google).to be_a(GoogleService)
  end
  describe "instance methods" do
    it 'returns lat and long with input address', :vcr do
      address = "1600 Amphitheatre Parkway, Mountain View, CA"
      response = GoogleService.new.latnlong(address)

      expect(response[:lat]).to eq(37.4215647)
      expect(response[:lng]).to eq(-122.0839988)
    end
  end
end
