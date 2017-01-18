require "rails_helper"

feature "user visits meme category page" do
  scenario "user visits category page" do
    evil_kermit = Category.create(name:"Evil Kermit", image_url: "kermit.com")
    coffee_kermit = Category.create(name: "Coffee Kermit", image_url: "kermit.com")

    visit category_path(evil_kermit)

    expect(page).to have_content "Evil Kermit"
    expect(page).to have_xpath("//img[contains(@src,'kermit.com')]")
  end
  pending scenario "user sees individual memes" do
    evil_kermit = Category.create(name:"Evil Kermit", image_url: "kermit.com")
    evil_kermit1 = Meme.create(name: "Evil Kermit 1", image_url: "kermit.com/1", category: evil_kermit)

    visit category_path(evil_kermit)

    expect(page).to have_xpath("//img[contains(@src,'kermit.com/1')]")

  end
  pending scenario "user adds new meme" do
    evil_kermit = Category.create(name:"Evil Kermit", image_url: "kermit.com")
    visit category_path(evil_kermit)

    fill_in "Meme Name", with: "Success Kid"
    fill_in "Meme URL", with: "www.successkid.com"
    click_button "Add Category"

    expect(page).to have_xpath("//img[contains(@src,'www.successkid.com')]")
  end
end
