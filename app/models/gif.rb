class Gif
  attr_reader :key_phrase

  def initialize(key_phrase)
    @key_phrase = key_phrase
  end

  def create_daily_image
    hash = Hash.new
    hash[:summary] = @key_phrase
    hash[:url] = giphy_lookup.first[:url]
    hash
  end

  private

  def giphy_lookup
    GiphyService.new.search(key_phrase)
  end
end
