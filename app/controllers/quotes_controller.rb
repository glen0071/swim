class QuotesController < ApplicationController
  def index
    @quotes = Quote.all
  end

  def new
    @quote = Quote.new
  end

  def show
    @quote = Quote.find(params[:id])
    @quote_concepts = @quote.concepts
  end

  def edit
    @concepts = Concept.all
    @quote = Quote.find(params[:id])
  end

  def create
    @quote = Quote.new
  end

  private

  def quote_params
    params.require(:quote).permit(:text, :author_id, :writing_id)
  end
end
