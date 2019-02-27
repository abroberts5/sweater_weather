class Api::V1::GifController < ApplicationController

  def show
    render json: GifForecast.new(params[:location]).updated_forecast
  end
end
