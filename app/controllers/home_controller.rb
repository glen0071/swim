class HomeController < ApplicationController
  def index

    respond_to do |format|
      format.html
      format.json { @concepts = Book.search(params[:query]) }
    end

  end
end
