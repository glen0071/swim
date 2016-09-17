class HomeController < ApplicationController
  def index

    @concepts = Concept.all

  end
end
