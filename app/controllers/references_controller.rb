class ReferencesController < ApplicationController
  def create
    quote = Quote.find(params['quote_id'])
    concept = Concept.find(params['concept_id'])
    quote.concepts << concept
    redirect_to quote_path(quote)
  end
end
