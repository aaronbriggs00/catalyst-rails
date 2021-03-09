class Api::CommentsController < ApplicationController
  def index
    @comments = Comment.all
    render "index.json.jb"
  end
  def show
    @comment = Comment.find(params[:id])
    render "show.json.jb"
  end
  def create
    @comment = Comment.new(
      value: params[:value],
      parent_id: params[:parent_id],
      post_id: params[:post_id]
    )
    if @comment.save
      render "show.json.jb", status: :created
    else
      render json: { errors: @comment.errors.full_messages }, status: :bad_request
    end
  end
  def update
    @comment = Comment.find(params[:id])
    @comment.value = params[:value] || @comment.value
    if @comment.save
      render "show.json.jb", status: 200
    else
      render json: { errors: @comment.errors.full_messages }, status: :bad_request
    end
  end
  def delete
    comment = Comment.find(params[:id])
    comment.value = nil
    comment.save
    render json: {message: "comment destroyed"}, status: 204
  end
end