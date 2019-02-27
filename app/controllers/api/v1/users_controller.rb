class  Api::V1::UsersController < ApplicationController

  def create
    key = key_generation
    if params[:password] == params[:password_confirmation]
      user = User.create({email: params["email"], password: params[:password],
      password_confirmation: params[:password_confirmation],
      api_key: key})
      render json: { api_key: user.api_key }, status: 201
    else
      render json: {error: "Password and Confirmation not the same"}, status: 401
    end
  end
end

  private

  def key_generation
    SecureRandom.urlsafe_base64
  end
