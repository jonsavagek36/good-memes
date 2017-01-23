require 'rails_helper'

feature 'view all users' do
  scenario 'admin views all users' do
    bob = Admin.create(email: "bob@123.com", password: "meme123", username: "bob")
    barb = User.create(email: "bob@23.com", password: "meme123", username: "barb")
    betty = User.create(email: "bob@3.com", password: "meme123", username: "bigbetty")


    sign_in bob

    click_on "View All Users"

    expect(page).to have_content(barb.email)
    expect(page).to have_content(betty.email)
    expect(page).to have_content(barb.username)
    expect(page).to have_content(betty.username)
    expect(page).to_not have_content(betty.password)
  end

  scenario 'general user cannot view other users' do
    bob = Admin.create(email: "bob@123.com", password: "meme123", username: "bob")
    barb = User.create(email: "bob@23.com", password: "meme123", username: "barb")
    betty = User.create(email: "bob@3.com", password: "meme123", username: "bigbetty")


    sign_in barb

    expect(page).to_not have_link("View All Users")

  end
end
