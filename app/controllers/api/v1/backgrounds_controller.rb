class Api::V1::BackgroundsController < ApplicationController

  def index
    image = Photo.new(params[:location]).grab_photo
    if image!= nil
      render json: { photo: image }, status: 201
    else
      default = "https://www.rd.com/wp-content/uploads/2018/02/00_Can-You-Guess-the-Famous-City-Based-on-Their-Skylines_441608320_Funny-Solution-Studio_FT.jpg"
      render json: { default_image: default }, status: 202
    end
  end
end
