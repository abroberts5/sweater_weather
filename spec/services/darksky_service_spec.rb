require 'rails_helper'

describe 'DarkSky Service' do
  it 'exists' do
    darksky = DarkskyService.new

    expect(darksky).to be_a(DarkskyService)
  end
  describe "instance methods" do
    it 'returns forecast request with latnlong', :vcr do
      lat = 37.4215647
      lng = -122.0839988
      response = DarkskyService.new.forecast(lat, lng)

      expect(response[:latitude]).to eq(37.4215647)
      expect(response[:longitude]).to eq(-122.0839988)
      expect(response[:timezone]).to eq("America/Los_Angeles")
    end
  end
end
