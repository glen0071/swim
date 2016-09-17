class ConceptsController < ApplicationController
  def index
    @concepts = Concept.all
    @name_array = Concept.all.map { |c|
      c.name
    }
  end

  def new
    @concept = Concept.new
  end

  def edit
    @concept = Concept.new
  end

  def create
    @concept = Concept.new(concept_params)

    if @concept.save
      redirect_to @concept
    else
      render 'new'
    end
  end

  def show
    @concept = Concept.find(params[:id])

    @quotes = @concept.quotes
  end

  private

  def concept_params
    params.require(:concept).permit(:name, :summary)
  end
end
