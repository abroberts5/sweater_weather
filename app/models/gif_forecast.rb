class GifForecast

  def initialize(location)
    @location = location
    @new_forecast = Hash.new
  end

  def updated_forecast
    five_day = []
    days_forecast.each do |day|
      gif = Gif.new(day[:summary])
    five_day << {
        time: day[:time],
        summary: day[:summary],
        url: gif.create_daily_image[:url]
      }
    end
    @new_forecast[:data] = Hash.new
    @new_forecast[:data][:images] = five_day
    @new_forecast[:copyright] = "#{Time.now.year}"
    @new_forecast
  end

  def days_forecast
    Forecast.new(@location).daily[:data][0..4]
  end
end
