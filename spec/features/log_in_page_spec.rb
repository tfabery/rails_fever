require 'rails_helper'

describe 'Log in/out process' do
  it "logs in with correct information" do
    visit log_in_path
    user = FactoryGirl.create(:user)
    fill_in 'username', :with => 'admin'
    fill_in 'password', :with => 'password'
    click_on 'Log in'
    expect(page).to have_content 'you have been logged in'
  end

  it "Error pops up when trying to log in with incorrect information" do
    visit log_in_path
    fill_in 'username', :with => 'admin'
    fill_in 'password', :with => 'password'
    click_on 'Log in'
    expect(page).to have_content 'Please try again'
  end

  it "Log out successfully" do
    visit log_in_path
    user = FactoryGirl.create(:user)
    fill_in 'username', :with => 'admin'
    fill_in 'password', :with => 'password'
    click_on 'Log in'
    click_on 'Log out'
    expect(page).to have_content "You've been logged out successfully"
  end
end
