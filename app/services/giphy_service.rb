class GiphyService

  def search(params)
    response = get_json("/v1/gifs/search?api_key=#{ENV["GIPHY_API_KEY"]}&q=#{params}&lang=en")
    response[:data]
  end

  private

  def conn
    Faraday.new(url: "https://api.giphy.com") do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end

  def get_json(url)
    url = URI.parse(URI.escape(url))
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end
