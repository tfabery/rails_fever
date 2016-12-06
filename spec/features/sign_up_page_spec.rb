require 'rails_helper'

describe 'Sign Up process' do
  it "Sign Up with correct information" do
    visit '/'
    click_on 'Sign Up'
    fill_in 'user_username', :with => 'admin'
    fill_in 'user_email', :with => 'admin@example.com'
    fill_in 'user_password', :with => 'password'
    fill_in 'user_password_confirmation', :with => 'password'
    first('input[type="submit"]').click
    expect(page).to have_content 'Welcome! You have signed up successfully.'
  end

  it "Error shows when user data cannot be saved" do
    visit '/'
    click_on 'Sign Up'
    first('input[type="submit"]').click
    expect(page).to have_content "Email can't be blank"
    expect(page).to have_content "Password can't be blank"
    expect(page).to have_content "Username can't be blank"
  end
end
