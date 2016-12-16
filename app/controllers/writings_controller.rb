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
    @writing = Writing.new(writing_params)

    if @writing.save
      redirect_to @writing
    else
      render 'new'
    end
  end

  def show
    @writing = Writing.find(params['id'])
    @concepts = @writing.concepts
  end

  private
  def writing_params
    params.require(:writing).permit(:title, :alt_title, :author_id)
  end
end
