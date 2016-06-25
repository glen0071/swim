class QuotesController < ApplicationController

  def index
    @quotes = Quote.all
  end

  def new
    @quote = Quote.new
  end

  def edit
    @quote = Quote.new
  end

  def create
    @quote = Quote.new
  end

  private
    def quote_params
      params.require(:quote).permit(:text, :author_id, :publication_id)
    end

end
