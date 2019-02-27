class Photo
  attr_reader :location

  def initialize(location)
    @location = location
  end

  def grab_photo
    get_coord = GoogleService.new.all_info(@location)[:geometry][:location]
    photo = FlickrService.new(get_coord[:lat], get_coord[:lng]).random
    photo.first[:title]
  end
end
