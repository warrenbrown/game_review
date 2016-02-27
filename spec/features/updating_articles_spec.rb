require 'rails_helper'

RSpec.feature 'Users can update articles' do
  before do
    article = FactoryGirl.create(:article, title:'Bobcats')
    visit '/'

    click_link 'Bobcats'
    click_link 'Edit'
  end
  scenario 'with valid attribues' do

    fill_in 'Title', with: 'Wildcats'
    click_button 'Update Article'

    expect(page).to have_content 'Article has been updated.'
    expect(page).to have_content 'Wildcats'
  end

    scenario "when providing invalid attributes" do
    fill_in "Title", with: ""
    click_button "Update Article"
    expect(page).to have_content "Article has not been updated."
    expect(page).to have_content "Title can't be blank"
  end
end
