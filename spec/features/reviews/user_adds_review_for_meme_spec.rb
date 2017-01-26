require 'rails_helper'

feature "user can add reviews for a meme" do
  scenario "adds a review for a meme successfully" do
    bob = FactoryGirl.create(:user)
    ek = FactoryGirl.create(:category)
    pizza = FactoryGirl.create(:meme, category: ek, user: bob)
    review = FactoryGirl.create(:review, meme: pizza, user: bob)


    sign_in bob
    visit meme_path(pizza)

    choose "♨️"
    fill_in "Comment:", with: "Absolute garbage"
    click_button "Submit Review"

    expect(page).to have_content "Review added successfully"
    expect(page).to have_content "1"
    expect(page).to have_content "Absolute garbage"
    expect(page).to have_content bob.username
  end

  scenario "user adds a review for a meme unsuccessfully" do
    bob = FactoryGirl.create(:user)
    ek = FactoryGirl.create(:category)
    pizza = FactoryGirl.create(:meme, category: ek, user: bob)
    review = FactoryGirl.create(:review, meme: pizza, user: bob)

    sign_in bob
    visit meme_path(pizza)

    click_button "Submit Review"

    expect(page).to have_content "Rating can't be blank"
  end
end
