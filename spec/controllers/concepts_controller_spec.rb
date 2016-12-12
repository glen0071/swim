require 'rails_helper'

RSpec.describe ConceptsController, type: :controller do

  let(:valid_attributes) {
    {name: 'name',
    summary: 'summary'}
  }

  # let(:invalid_attributes) {
  #   skip("Add a hash of attributes invalid for your model")
  # }

  describe 'GET index' do
    it 'renders index template' do
      concept = Concept.create! valid_attributes
      get :index, params: {}
      expect(response).to render_template('index')
      expect(assigns(:concepts)).to eq([concept])
    end
  end

  describe 'GET new' do
    it 'assigns @concept' do
      get :new
      expect(assigns(:concept)).to be_a_new(Concept)
    end
  end

end
