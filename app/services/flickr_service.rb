class FlickrService
  def initialize(lat, lng)
    @lat = lat
    @lng = lng
  end

  def random
    result = get_json
    result["photos"]["photo"]
  end

  private

  def conn
    Faraday.new(url: "https://api.flickr.com") do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end

  def get_json
    response = conn.get("services/rest/") do |url|
      url.params['method'] = "flickr.photos.search"
      url.params['api_key'] = ENV['FLICKR_API_KEY']
      url.params['format'] = "json"
      url.params['lat'] = @lat
      url.params['lon'] = @lng
      url.params['content_type'] = "0"
      url.params['privacy_filter'] = "1"
      url.params['nojsoncallback'] = "true"
      url.params['safe_search'] = "1"
      url.params['geo_context'] = "2"
    end
    JSON.parse(response.body)
  end
end
