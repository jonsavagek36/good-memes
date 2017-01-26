require 'rails_helper'

feature 'deleting a user' do
    scenario 'admin views all users and deletes user' do
    bob = FactoryGirl.create(:user, admin: true)
    barb = FactoryGirl.create(:user, email: "bob@23.com", password: "meme123", username: "barb", admin: false)
    betty = FactoryGirl.create(:user, email: "bob@3.com", password: "meme123", username: "bigbetty", admin: false)

    sign_in bob
    visit '/'
    click_on "View All Users"

    click_link("delete #{betty.id}")

    expect(page).to have_content(barb.email)
    expect(page).to_not have_content(betty.email)
    expect(page).to have_content(barb.username)
    expect(page).to_not have_content(betty.username)
    expect(page).to_not have_content(betty.password)
  end
end
