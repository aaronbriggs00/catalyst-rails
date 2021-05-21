class Api::VotesController < ApplicationController
  before_action :authenticate_user
  def create
    if Vote.where(["post_id = ? and user_id = ?", params[:post_id], current_user.id])[0] && params[:post_id]
      Vote.where(["post_id = ? and user_id = ?", params[:post_id], current_user.id])[0].destroy
    end
    if Vote.where(["comment_id = ? and user_id = ?", params[:comment_id], current_user.id])[0] && params[:comment_id]
      Vote.where(["comment_id = ? and user_id = ?", params[:comment_id], current_user.id])[0].destroy
    end   
    @vote = Vote.new(
      comment_id: params[:comment_id],
      post_id: params[:post_id],
      user_id: current_user.id,
      value: params[:value],
    )
    if @vote.save
      render json: "nice!", status: :created
    else
      render json: { errors: @vote.errors.full_messages }, status: :bad_request
    end
  end
end
