
describe "Forecast Model" do
  it "can call api" do
    forecast = Forecast.new("denver,co")

    expect(forecast.city).to eq("Denver")
    expect(forecast.country).to eq("US")
    expect(forecast.state).to eq("CO")
    expect(forecast.daily[:data]).to be_an(Array)
    expect(forecast.location).to eq("denver,co")
  end
end
