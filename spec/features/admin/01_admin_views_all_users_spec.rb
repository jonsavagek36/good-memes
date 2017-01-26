require 'rails_helper'

feature 'view all users' do
  scenario 'admin views all users' do
    bob = FactoryGirl.create(:user, admin: true)
    barb = FactoryGirl.create(:user, email: "bob@23.com", password: "meme123", username: "barb", admin: false)
    betty = FactoryGirl.create(:user, email: "bob@3.com", password: "meme123", username: "bigbetty", admin: false)

    sign_in betty
    sign_out betty
    sign_in barb
    sign_out barb
    sign_in bob
    visit '/'
    click_on "View All Users"

    expect(page).to have_content(barb.email)
    expect(page).to have_content(betty.email)
    expect(page).to have_content(barb.username)
    expect(page).to have_content(betty.username)
    expect(page).to_not have_content(betty.password)
  end

  scenario 'general user cannot view other users' do
    bob = FactoryGirl.create(:user, admin: true)
    barb = FactoryGirl.create(:user, email: "bob@23.com", password: "meme123", username: "barb", admin: false)
    betty = FactoryGirl.create(:user, email: "bob@3.com", password: "meme123", username: "bigbetty", admin: false)


    sign_in barb

    expect(page).to_not have_link("View All Users")

  end
end
