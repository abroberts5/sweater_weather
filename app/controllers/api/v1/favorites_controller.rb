class Api::V1::FavoritesController < ApplicationController

  def index
    if User.find_by(api_key: params[:api_key])
      favorites = Favorite.find_favorites(params[:api_key])
      render json: { body: favorites }, status: 200
    else
      render json: { error: "Unauthorized" }, status: 401
    end
  end

  def create
    if User.find_by(api_key: params[:api_key])
      favorite = Favorite.create(location: params[:location], api_key: params[:api_key])
      render json: { api_key: favorite.api_key, location: favorite.location }, status: 201
    else
      render json: { error: "Unauthorized" }, status: 401
    end
  end

  def destroy
    if User.find_by(api_key: params[:api_key])
      find_favorite.destroy
      render json: { body: "Favorite Deleted" }, status: 200
    else
      render json: {error: "Unauthorized"}, status: 401
    end
  end

  private

  def find_favorite
    Favorite.find_by(api_key: params["api_key"], location: params["location"])
  end
end
