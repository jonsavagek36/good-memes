require 'rails_helper'

feature "profile photo" do
  scenario "new user sees avatar upload option at edit profile page" do
    sharona = User.create(email: "my@sharona.com", username: "sharona", password: "123456", admin: false)

    visit root_path
    click_link "Login"
    fill_in 'Email', with: sharona.email
    fill_in 'Password', with: sharona.password
    click_button "Log in"
    click_link "Edit profile"
    expect(page).to have_button("Update")
    expect(page).to have_content("Avatar")
  end

  scenario "user upload an avatar" do
    sharona = User.create(email: "my@sharona.com", username: "sharona", password: "123456", admin: false)

    visit root_path
    click_link "Login"
    fill_in 'Email', with: sharona.email
    fill_in 'Password', with: sharona.password
    click_button "Log in"
    click_link "Edit profile"
    attach_file "Avatar", "#{Rails.root}/spec/support/images/HotSprings.png"
    expect(page).to have_content(sharona.email)
    expect(page).to have_xpath("//img")
  end

  scenario "user edits an avatar" do
    sharona = User.create(email: "my@sharona.com", username: "sharona", password: "123456", admin: false, avatar: "")

    visit root_path
    click_link "Login"
    fill_in 'Email', with: sharona.email
    fill_in 'Password', with: sharona.password
    click_button "Log in"
    click_link "Edit profile"
    expect(page).to have_content(sharona.email)
    attach_file "Avatar", "#{Rails.root}/spec/support/images/HotSprings.png"
    expect(page).to have_xpath("//img")
  end
end
