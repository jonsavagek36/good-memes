require 'rails_helper'

feature "user can add memes for category" do

  scenario "adds a meme for a category successfully" do
    ek = FactoryGirl.create(:category)
    bob = FactoryGirl.create(:user)

    visit '/'
    sign_in bob
    sign_out bob

    visit category_path(ek)
    sign_in bob

    expect(page).to have_content "Add a meme!"
    fill_in "Name", with: "Earned Pizza"
    fill_in "Image Url", with: "https://thechive.files.wordpress.com/2016/11/evil-kermit-meme-dark-side-funny-memes-14.jpg?quality=85&strip=info&w=600"

    click_button "Add Meme"
    expect(page).to have_content "Meme successfully added"
    expect(page).to have_xpath("//img[contains(@src,'https://thechive.files.wordpress.com/2016/11/evil-kermit-meme-dark-side-funny-memes-14.jpg?quality=85&strip=info&w=600')]")
    expect(page).to have_content ek.name
  end

  scenario "adds a meme for a category unsuccessfully" do
    ek = FactoryGirl.create(:category)
    bob = FactoryGirl.create(:user)

    visit categories_path
    visit category_path(ek)
    sign_in bob

    expect(page).to have_content "Add a meme!"

    fill_in "Name", with: "Happy Kermit"

    click_button "Add Meme"

    expect(page).to have_content ek.name
    expect(page).to have_content "Add a meme!"
    expect(page).to have_content "Img url can't be blank"
  end
end
