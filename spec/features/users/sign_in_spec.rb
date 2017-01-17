require 'rails_helper'

feature "User signs in" do
  let(:user) do
    User.create(
      email: "testing@GoodMemes.com",
      password: "Super123"
    )
  end

  scenario "successful signs in" do
    visit root_path
    sign_in_as user

    expect(page).to have_content "You're now signed in as #{user.username}!"
  end

  scenario "successful sign out" do
    visit root_path
    sign_in_as user
    click_link "Sign Out"

    expect(page).to have_content "You have been signed out"
  end
end
