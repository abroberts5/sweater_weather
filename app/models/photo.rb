class Photo
  attr_reader :location

  def initialize(location)
    @location = location
  end

  def grab_photo
    GoogleService.new.all_info(@location)[:geometry][:location]
    parse_url
  end

  def parse_url
    photo = FlickrService.new(@location).random
    "https://farm#{photo['farm']}.staticflickr.com/#{photo['server']}/#{photo['id']}_#{photo['secret']}.jpg"
  end
end
