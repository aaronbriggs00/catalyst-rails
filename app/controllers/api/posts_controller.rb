class Api::PostsController < ApplicationController
  before_action :authenticate_user, except: [:show, :index]
  def index
    @posts = Post.all
    render "index.json.jb"
  end
  def show
    @post = Post.find(params[:id])
    render "show.json.jb"
  end
  def create
    @post = Post.new(
      board_id: params[:board_id],
      title: params[:title],
      user_id: params[:user_id],
      text: params[:text],
      hyperlink: params[:hyperlink],
      image_url: params[:image_url],
      user_id: current_user.id
    )
    if @post.save
      render "show.json.jb", status: :created
    else
      render json: { errors: @post.errors.full_messages }, status: :bad_request
    end
  end
  def update
    @post = Post.find(params[:id])
    @post.title = params[:title] || @post.title
    @post.text = params[:text] || @post.text
    @post.hyperlink = params[:hyperlink] || @post.hyperlink
    @post.image_url = params[:image_url] || @post.image_url
    if @post.save
      render "show.json.jb", status: 200
    else
      render json: { errors: @post.errors.full_messages }, status: :bad_request
    end
  end
  def delete
    post = Post.find(params[:id])
    post.text = nil
    post.image_url = nil
    post.hyperlink = nil
    post.save
    render json: {message: "post destroyed"}, status: 204
  end
end
