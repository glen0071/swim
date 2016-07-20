require 'rails_helper'

RSpec.describe ConceptsController, type: :controller do

  describe 'GET index' do
    it 'renders index template' do
      get :index
      expect(response).to render_template('index')
    end

    it 'renders index template' do
      get :index
      expect(response).to render_template('index')
    end
  end

  describe 'GET new' do
    it 'assigns @concept' do
      get :new
      expect(assigns(:concept)).to be_a_new(Concept)
    end
  end

end
