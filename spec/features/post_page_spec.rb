require 'rails_helper'

describe 'new comment process', js: true do
  it 'creates new comment' do
    visit '/'
    click_on 'Login'
    user = FactoryGirl.create(:user)
    post = FactoryGirl.create(:post, user: user)
    fill_in 'user_login', :with => 'admin'
    fill_in 'user_password', :with => 'password'
    click_on 'Log in'
    click_link 'test'
    fill_in 'comment_content', with: 'test comment'
    click_button 'Save'
    expect(page).to have_content 'test comment'
  end
end
