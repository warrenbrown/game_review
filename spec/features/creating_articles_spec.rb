require 'rails_helper'

RSpec.feature 'Users can create articles' do
  scenario 'with valid attributes' do
    visit '/'
    click_link 'New Article'
    fill_in 'Title', with: 'My title'
    fill_in 'Body', with: 'Content'
    click_button 'Create Article'

    expect(page).to have_content 'Article has been created.'
    expect(page).to have_content 'My title'
  end

  scenario 'using invalid attributes' do
    visit '/'
    click_link 'New Article'
    fill_in 'Title', with: ''
    fill_in 'Body', with: 'Content'
    click_button 'Create Article'
    expect(page).to have_content 'Article has not been created.'
    expect(page).to have_content "Title can't be blank"
  end
end
