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
      thread_id: params[:thread_id]
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
      render "show.json.jb", status: :created
    else
      render json: { errors: @comment.errors.full_messages }, status: :bad_request
    end
  end
  def delete
    comment = Comment.find(params[:id])
    comment.destroy
    render json: {message: "comment destroyed"}
  end
end
