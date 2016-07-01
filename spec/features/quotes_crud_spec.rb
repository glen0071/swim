require 'rails_helper'

feature 'index page' do
  scenario 'Quotes headline' do
    visit quotes_path
    expect(page).to have_content('Quotes')
  end

  scenario 'root routes to Quotes concepts' do
    visit root_path
    expect(page).to have_content('Concepts')
  end
end

feature 'create page' do
  scenario 'Add Quotes headline' do
    visit new_quote_path
    expect(page).to have_content('Add Quote')
  end

  # scenario 'add quote' do
  #   visit new_quote_path
  #
  #   fill_in('Text', with: "Here is the text of the first quote")
  # end
end
