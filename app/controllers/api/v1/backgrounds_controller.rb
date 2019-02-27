class Api::V1::BackgroundsController < ApplicationController

  def index
    image = Photo.new(params[:location]).grab_photo
    render json: { photo: image }, status: 201
  end
end
