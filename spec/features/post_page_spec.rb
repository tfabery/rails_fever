require 'rails_helper'

describe 'new comment process', js: true do
  it 'creates new comment' do
    visit log_in_path
    user = FactoryGirl.create(:user)
    post = FactoryGirl.create(:post, user: user)
    fill_in 'username', :with => 'admin'
    fill_in 'password', :with => 'password'
    click_on 'Log in'
    click_link 'test'
    click_link 'Add comment'
    fill_in 'Content', with: 'test comment'
    click_button 'Post comment'
    expect(page).to have_content 'test comment'
  end
end
