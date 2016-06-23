require 'rails_helper'

feature 'Publication cruds' do

  scenario 'Publication index headline' do
    visit publications_path
    expect(page).to have_content('Publications')
  end

  scenario 'add Publication' do
    visit new_publication_path
    fill_in('Name', with: 'Publication Name')
    click_on('Save Publication')

    expect(page).to have_content('Publication Name')
  end

end
