require 'rails_helper'

describe "Gif Model" do
  it 'can then call api', :vcr do
    giph = Gif.new("grey day")

    expect(giph.key_phrase).to eq("grey day")
    expect(giph.create_daily_image).to be_an(Hash)
    expect(giph.create_daily_image).to have_key(:summary)
    expect(giph.create_daily_image).to have_key(:url)
  end
end
