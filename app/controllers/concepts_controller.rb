class ConceptsController < ApplicationController

  def index
    @concepts = Concept.all
  end

  def new
    @concept = Concept.new
  end

  def edit
    @concept = Concept.new
  end

  def create
    @concept = Concept.new
  end

  private
    def concept_params
      params.require(:concept).permit(:name, :summary)
    end

end
