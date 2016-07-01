class WritingsController < ApplicationController
  def index
    @writings = Writing.all
  end

  def new
    @writing = Writing.new
  end

  def edit
    @writing = Writing.new
  end

  def create
    @writing = Writing.new
  end

  private

  def quote_params
    params.require(:writing).permit(:title, :alt_title)
  end
end
