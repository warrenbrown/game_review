require 'rails_helper'

RSpec.feature 'Users can create comments on articles' do
  before do
    article = FactoryGirl.create(:article, title: 'Kayaking')

    visit article_path(article)
  end
  scenario 'with valid attributes' do
    fill_in 'Name', with: 'Joe Budden'
    fill_in 'Content', with: 'This was a good article'
    click_button 'Create Comment'

    expect(page).to have_content 'Comment has been created.'
    expect(page).to have_content 'This was a good article'
  end
end
