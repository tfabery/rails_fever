require 'rails_helper'

describe 'new post creating process' do
  it "create a post" do
    visit '/'
    click_on 'Login'
    user = FactoryGirl.create(:user)
    fill_in 'user_login', :with => 'admin'
    fill_in 'user_password', :with => 'password'
    click_on 'Log in'
    first(:button, 'New Post').click
    fill_in 'post_title', with: 'test post'
    fill_in 'post_content', with: 'test content'
    click_on 'Save'
    expect(page).to have_content 'test post'
  end

  it "Error pops up when creating post with empty fields" do
    visit '/'
    click_on 'Login'
    user = FactoryGirl.create(:user)
    fill_in 'user_login', :with => 'admin'
    fill_in 'user_password', :with => 'password'
    click_on 'Log in'
    first(:button, 'New Post').click
    click_on 'Save'
    expect(page).to have_content "Title can't be blank, Content can't be blank"
  end
end
