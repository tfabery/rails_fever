require 'rails_helper'

describe 'new post creating process' do
  it "create a post" do
    visit log_in_path
    user = FactoryGirl.create(:user)
    fill_in 'username', :with => 'admin'
    fill_in 'password', :with => 'password'
    click_on 'Log in'
    click_on 'New Post'
    fill_in 'Title', with: 'test post'
    fill_in 'Content', with: 'test content'
    click_on 'Post'
    expect(page).to have_content 'test post'
  end

  it "Error pops up when creating post with empty fields" do
    visit log_in_path
    user = FactoryGirl.create(:user)
    fill_in 'username', :with => 'admin'
    fill_in 'password', :with => 'password'
    click_on 'Log in'
    click_on 'New Post'
    click_on 'Post'
    expect(page).to have_content 'errors'
  end
end
