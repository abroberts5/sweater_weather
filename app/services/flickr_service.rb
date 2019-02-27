class FlickrService
  def initialize(location)
    @location = location
  end

  def random
    result = get_json
    result["photos"]["photo"].sample
  end

  private

  def conn
    Faraday.new(url: "https://api.flickr.com") do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end

  def get_json
    response = conn.get("services/rest/") do |url|
      url.params['method'] = "flickr.photos.getrecent"
      url.params['api_key'] = ENV['FLICKR_API_KEY']
      url.params['format'] = "json"
      url.params['location'] = @location
      url.params['content_type'] = "1"
      url.params['nojsoncallback'] = "true"
      url.params['safe_search'] = "1"
      url.params['safe_search'] = "1"
      url.params['sort'] = "relevance"
    end
    JSON.parse(response.body)
  end
end

# https://farm{farm-id}.staticflickr.com/{server-id}/{id}_{secret}.jpg
