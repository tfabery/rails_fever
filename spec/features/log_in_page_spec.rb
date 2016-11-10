require 'rails_helper'

describe 'Log in/out process' do
  it "logs in with correct information" do
    visit '/'
    click_on 'Login'
    user = FactoryGirl.create(:user)
    fill_in 'user_login', :with => 'admin'
    fill_in 'user_password', :with => 'password'
    click_on 'Log in'
    expect(page).to have_content 'Logout'
  end

  it "Error pops up when trying to log in with incorrect information" do
    visit '/'
    click_on 'Login'
    fill_in 'user_login', :with => 'admin'
    fill_in 'user_password', :with => 'password'
    click_on 'Log in'
    expect(page).to have_content 'Invalid Login or password'
  end

  it "Log out successfully" do
    visit '/'
    click_on 'Login'
    user = FactoryGirl.create(:user)
    fill_in 'user_login', :with => 'admin'
    fill_in 'user_password', :with => 'password'
    click_on 'Log in'
    click_on 'Logout'
    expect(page).to have_content "Login"
  end
end
