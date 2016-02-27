require 'rails_helper'

RSpec.feature 'Users can create articles' do
  before do
    visit '/'
    click_link 'New Article'
  end
  scenario 'with valid attributes' do

    fill_in 'Title', with: 'My title'
    fill_in 'Body', with: 'Content'
    click_button 'Create Article'

    expect(page).to have_content 'Article has been created.'
    expect(page).to have_content 'My title'
  end

  scenario 'using invalid attributes' do

    fill_in 'Title', with: ''
    fill_in 'Body', with: 'Content'
    click_button 'Create Article'
    expect(page).to have_content 'Article has not been created.'
    expect(page).to have_content "Title can't be blank"
  end
  scenario 'with and attatchment' do
    fill_in "Title", with: "Add documentation for blink tag"
    fill_in "Body", with: "The blink tag has a speed attribute"
    attach_file "Image", "spec/fixtures/speed.txt"
    click_button "Create Article"

    within("#articles .attachment") do
      expect(page).to have_content "speed.txt"
    end
  end
end
