require 'rails_helper'

feature 'index page' do

  scenario 'Quotes headline' do
    visit quotes_path
    expect(page).to have_content('Quotes')
  end

end


feature 'create page' do

  scenario 'Add Quotess headline' do
    visit new_quote_path
    expect(page).to have_content('Add Quote')
  end

  # scenario 'add quote' do
  #   visit new_quote_path
  #
  # end

end
