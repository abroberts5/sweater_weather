class DarkskyService

  def forecast(lat, lng)
    Rails.cache.fetch("weather_info_#{lat}_#{lng}", expires_in: 1.day) do
      get_json("/forecast/#{ENV["DARK_SKY_API"]}/#{lat},#{lng}")
    end
  end

  private

  def conn
    Faraday.new(url: "https://api.darksky.net") do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end

  def get_json(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end
