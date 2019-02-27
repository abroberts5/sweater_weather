class Forecast

  attr_reader :location

  def initialize(location)
    @location = location
  end

  def city
    google_lookup[:address_components].first[:long_name]
  end

  def state
    google_lookup[:address_components].third[:short_name]
  end

  def country
    google_lookup[:address_components].fourth[:short_name]
  end

  def currently
    darksky_lookup[:currently]
  end

  def hourly
    darksky_lookup[:hourly]
  end

  def daily
    darksky_lookup[:daily]
  end

  private

  def google_lookup
    GoogleService.new.all_info(location)
  end

  def lat_snatch
    google_lookup[:geometry][:location][:lat]
  end

  def lng_snatch
    google_lookup[:geometry][:location][:lng]
  end

  def darksky_lookup
    lat = lat_snatch
    lng = lng_snatch
    DarkskyService.new.forecast(lat, lng)
  end
end
