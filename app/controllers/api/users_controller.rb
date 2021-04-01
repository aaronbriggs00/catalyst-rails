class Api::UsersController < ApplicationController
  def index
    render json: {message: "index"}
  end
  def show
    render json: {message: "show"}
  end
  def create
    user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    if user.save
      render json: { message: "User created successfully" }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end
  end
  def update
    render json: {message: "update"}
  end
  def delete
    render json: {message: "delete"}
  end
end
