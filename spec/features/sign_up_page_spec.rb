require 'rails_helper'

describe 'Sign Up process' do
  it "Sign Up with correct information" do
    visit new_user_path
    fill_in 'Username', :with => 'admin'
    fill_in 'Password', :with => 'password'
    fill_in 'Password confirmation', :with => 'password'
    click_on 'Sign Up'
    expect(page).to have_content 'Welcome to Fever!'
  end

  it "Error shows when user data cannot be saved" do
    visit new_user_path
    click_on 'Sign Up'
    expect(page).to have_content 'Please try again'
  end
end
