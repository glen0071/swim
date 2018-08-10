class ConceptsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @concepts = Concept.all.sort { |a, b| a.name <=> b.name }
    @name_array = Concept.all.map(&:name)
  end

  def new
    @concept = Concept.new
  end

  def edit
    @concept = Concept.find(params[:id])
  end

  def update
    @concept = Concept.find(params[:id])
    if @concept.update(concept_params)
      @concept.update_attributes(user: current_user)
      redirect_to @concept, notice: 'Concept was successfully updated.'
    else
      render :edit
    end
  end

  def create
    @concept = Concept.new(concept_params)
    @concept.user = current_user
    if @concept.save
      redirect_to @concept
    else
      render 'new'
    end
  end

  def show
    @concept = Concept.find(params[:id])

    @quotes = @concept.quotes
    @quote = Quote.new
  end

  private

  def concept_params
    params.require(:concept).permit(:name, :summary)
  end
end
