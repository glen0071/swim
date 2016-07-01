require 'rails_helper'

feature 'Author cruds page' do
  scenario 'Author index headline' do
    visit authors_path
    expect(page).to have_content('Authors')
  end

  scenario 'add Author' do
    visit new_author_path
    fill_in('Name', with: 'Author Name')
    click_on('Save Author')

    expect(page).to have_content('Author Name')
  end
end
