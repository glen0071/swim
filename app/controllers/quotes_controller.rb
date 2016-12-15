class QuotesController < ApplicationController
  before_action :set_quote, only: [:show, :edit, :update, :destroy]

  def index
    @quotes = Quote.all
  end

  def show
    @quote_concepts = @quote.concepts
  end

  def new
    @quote = Quote.new
  end

  def edit
    @concepts = Concept.all.sort { |a, b| a.name <=> b.name }
    @quote_concepts = @quote.concepts
  end

  def update
    if @quote.update(quote_params)
      redirect_to @quote, notice: 'Widget was successfully updated.'
    else
      render :edit
    end
  end

  def create
    @quote = Quote.new(quote_params)

    if @quote.save
      redirect_to @quote
    else
      render 'new'
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_quote
    @quote = Quote.find(params[:id])
  end

  def quote_params
    params.require(:quote).permit(:text, :author_id, :writing_id, concept_ids: [])
  end
end
