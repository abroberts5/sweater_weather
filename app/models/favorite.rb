class Favorite < ApplicationRecord
  validates_presence_of :location, :api_key

  def self.find_favorites(api_key)
    all_favorites = Favorite.all
    results = all_favorites.each do |favorite|
      if favorite.api_key == api_key
        favorite
      end
    end
    remap_favorites(results)
  end

  def self.remap_favorites(list)
    array = []
    list.each do |favorite|
      new_forecast = Forecast.new(favorite.location)
      array << { location: favorite.location,
              current_weather: {
              summary: new_forecast.currently[:summary],
              icon: new_forecast.currently[:icon],
              temp: new_forecast.currently[:temperature]
              }
            }
      end
    array
  end
end
