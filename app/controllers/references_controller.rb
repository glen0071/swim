class ReferencesController < ApplicationController
  def create
    quote = Quote.find(params['quote_id'])
    concept = Concept.find(params['concept_id'])
    quote.add_concept(concept)
    Reference.find_by(concept: concept, quote: quote).update_attributes(user: current_user)
    redirect_to quote_path(quote)
  end

  def destroy
    reference = Reference.find_by(concept_id: params[:concept_id], quote_id: params[:quote_id])
    reference.destroy

    redirect_to quote_path(params[:quote_id])
  end
end
