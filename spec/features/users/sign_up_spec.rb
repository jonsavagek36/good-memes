require 'rails_helper'

feature 'sign up' do
  # Acceptance Criteria:
  # * I must specify a valid email address
  # * I must specify a password, and confirm that password
  # * If I do not perform the above, I get an error message
  # * If I specify valid information, I register my account and am authenticated
  scenario 'with valid information' do
    visit root_path
    click_link 'Sign up'
    fill_in 'Email', with: 'john@example.com'
    fill_in 'Username', with: 'john'
    fill_in 'user_password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Sign up'
    expect(page).to have_content('Welcome! You have signed up successfully.')
    expect(page).to have_content('Logout')
  end

  scenario 'with missing information' do
    visit root_path
    click_link 'Sign up'
    click_button 'Sign up'
    expect(page).to have_content("can't be blank")
  end

  scenario 'with a conflicting password confirmation' do
    visit root_path
    click_link 'Sign up'
    fill_in 'user_password', with: 'password'
    fill_in 'Password confirmation', with: 'something different'
    click_button 'Sign up'
    expect(page).to have_content("doesn't match")
  end
end
