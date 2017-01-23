require 'rails_helper'

feature 'deleting a user' do
  scenario 'admin views all users and deletes user' do
    bob = Admin.create(email: "bob@123.com", password: "meme123", username: "bob")
    barb = User.create(email: "bob@23.com", password: "meme123", username: "barb")
    betty = User.create(email: "bob@3.com", password: "meme123", username: "bigbetty")


    sign_in bob

    click_on "View All Users"

    click_on "Delete"

    click_on "Yes"

    expect(page).to have_content(barb.email)
    expect(page).to_not have_content(betty.email)
    expect(page).to have_content(barb.username)
    expect(page).to_not have_content(betty.username)
    expect(page).to_not have_content(betty.password)
  end
end
