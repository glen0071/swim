require 'rails_helper'

feature 'index page' do

  scenario 'Quotes headline' do
    visit quotes_path
    expect(page).to have_content('Quotes')
  end

  

end
