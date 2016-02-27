require 'rails_helper'

RSpec.feature 'Users can view articles' do
  scenario 'viewing all details' do
    article = FactoryGirl.create(:article, title: 'My Title', body:'Content')

    visit '/'
    click_link 'My Title'
    expect(page.current_url).to eq article_url(article)
  end
end
