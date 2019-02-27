class DarkskyService

  def forecast(lat, lng)
    get_json("/forecast/#{ENV["DARK_SKY_API"]}/#{lat},#{lng}")
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
