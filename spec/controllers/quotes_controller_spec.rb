require 'rails_helper'

RSpec.describe QuotesController, type: :controller do

  describe "GET index" do
    it "renders index template" do
      get :index
      expect(response).to render_template('index')
    end
  end

  describe "GET new" do
    it "assigns @quote" do
      get :new
      expect(assigns(:quote)).to be_a_new(Quote)
    end
  end

  # describe "GET create" do
  #   it "assigns @quote" do
  #     get :create
  #     expect(assigns(:quote)).to be_a_new(Quote)
  #   end
  # end

end
