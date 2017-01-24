require 'rails_helper'

feature 'deleting a user' do
    pending scenario 'admin views all users and deletes user' do
    bob = User.create(email: "bob@123.com", password: "meme123", username: "bob", admin: true)
    barb = User.create(email: "bob@23.com", password: "meme123", username: "barb", admin: false)
    betty = User.create(email: "bob@3.com", password: "meme123", username: "bigbetty", admin: false)

    sign_in barb
    sign_out barb
    sign_in betty
    sign_out betty
    sign_in bob
    visit '/'
    click_on "View All Users"

    #find.(".{betty.id}").click
    #page.first(".delete").click
    click_link "delete"

    expect(page).to have_content(barb.email)
    expect(page).to_not have_content(betty.email)
    expect(page).to have_content(barb.username)
    expect(page).to_not have_content(betty.username)
    expect(page).to_not have_content(betty.password)
  end
end
