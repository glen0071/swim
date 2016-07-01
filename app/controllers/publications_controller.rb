class PublicationsController < ApplicationController
  def index
    @publications = Publication.all
  end

  def new
    @publication = Publication.new
  end

  def create
    @publication = Publication.new(publication_params)
    if @publication.save
      redirect_to @publication
    else
      render 'new'
    end
  end

  def show
    @publication = Publication.find(params[:id])
  end

  private

  def publication_params
    params.require(:publication).permit(:name, :author, :publication_year)
  end
end
