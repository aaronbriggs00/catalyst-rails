class Api::BoardsController < ApplicationController
  def index
    @boards = Board.all
    render "index.json.jb"
  end
  def show
    @board = Board.find_by('title ILIKE ?', params[:title])
    render "show.json.jb"
  end
end
