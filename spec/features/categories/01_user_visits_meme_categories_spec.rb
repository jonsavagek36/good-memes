require 'rails_helper'

feature "user visits meme categories" do
  scenario "user visits category directory and sees categories" do
    evil_kermit = Category.create(name:"Evil Kermit", image_url: "kermit.com")
    coffee_kermit = Category.create(name: "Coffee Kermit", image_url: "kermit2.com")
    visit categories_path

    expect(page).to have_xpath("//img[contains(@src,'kermit.com')]")
  end
  scenario "user adds new category" do
    visit new_category_path

    fill_in "Category Name", with: "Success Kid"
    fill_in "Category URL", with: "www.successkid.com"
    click_button "Add Category"

    expect(page).to have_xpath("//img[contains(@src,'www.successkid.com')]")

  end
  scenario "user fails to add a new category" do
    visit new_category_path
    click_button "Add Category"

    expect(page).to have_content "Name can't be blank"
    expect(page).to have_content "Image url can't be blank"
  end
end
