require 'rails_helper'

RSpec.feature 'Users can delete Articles' do
  scenario 'Successfully' do
    article = FactoryGirl.create(:article)

    visit '/'
    click_link article.title
    click_link 'Delete Article'

    expect(page).to have_content 'Article has been deleted.'
    expect(page).to have_no_content article.title
  end
end
