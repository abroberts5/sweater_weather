class ForecastSerializer
  include FastJsonapi::ObjectSerializer

  set_id :lat_snatch

  attributes :city, :state, :country, :currently,
             :hourly, :daily
end
  
