class Api::SubscriptionsController < ApplicationController
  before_action :authenticate_user
  def index
    render json: "index"
  end
  def create
    @subscription = Subscription.new(
      user_id: current_user.id,
      board_id: params[:board_id]
    )
    if @subscription.save
      render json: {message: "subscription created"}, status: 200
    else
      render json: { errors: @post.errors.full_messages }, status: :bad_request
    end
  end
  def delete
    render json: "delete"
  end
end
