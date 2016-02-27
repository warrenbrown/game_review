require 'rails_helper'

RSpec.feature 'Users can update articles' do
  scenario 'with valid attribues' do
    article = FactoryGirl.create(:article, title:'Bobcats')
    visit '/'

    click_link 'Bobcats'
    click_link 'Edit'
    fill_in 'Title', with: 'Wildcats'
    click_button 'Update Article'

    expect(page).to have_content 'Article has been updated.'
    expect(page).to have_content 'Wildcats'
  end
end
