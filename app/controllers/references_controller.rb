class ReferencesController < ApplicationController
  def create
    params
    quote = Quote.find(params['quote_id'])
    concept = Concept.find(params['concept_id'])
    quote.concepts << concept
    redirect_to root_path
  end
end