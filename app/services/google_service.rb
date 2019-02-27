class GoogleService

  def latnlong(address)
    updated = update_address(address)
    query = get_json("/maps/api/geocode/json?address=#{updated}&key=#{ENV["GOOGLE_API_KEY"]}")
    query[:results].first[:geometry][:location]
  end

  def all_info(address)
    updated = update_address(address)
    query = get_json("/maps/api/geocode/json?address=#{updated}&key=#{ENV["GOOGLE_API_KEY"]}")
    query[:results].first
  end

  private

  def update_address(address)
    updated = address.downcase.split
    updated.map do |word|
      if word.match?("[0-9]")
        word
      elsif word.match?("[a-z]") && word.length == 2
        "+" + word.upcase
      else
        "+" + word.capitalize
      end
    end.join
  end

  def conn
    Faraday.new(url: "https://maps.googleapis.com") do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end

  def get_json(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end
