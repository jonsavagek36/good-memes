require 'rails_helper'

feature "user sees memes of category on category show page" do
  scenario "sees memes for specific category" do
    bob = FactoryGirl.create(:user)
    ek = FactoryGirl.create(:category)
    pizza = FactoryGirl.create(:meme, category: ek, user: bob)

    visit category_path(ek)
    sign_in bob
    expect(page).to have_content ek.name
    expect(page).to have_xpath("//img[contains(@src,pizza.img_url)]")

  end

  scenario "does not see memes for other categories" do
    bob = FactoryGirl.create(:user)
    ek = FactoryGirl.create(:category)
    pizza = FactoryGirl.create(:meme, category: ek, user: bob)
    sk = FactoryGirl.create(:category, name: "Success Kid", image_url: "http://cdn-aws-01.mummypages.co.uk/images/3788/189/9/1_1/kid.jpg")
    fri = FactoryGirl.create(:meme, name: "It's Friday", img_url: "http://i.dailymail.co.uk/i/pix/2016/03/18/17/32570AD700000578-3498922-image-a-73_1458323147637.jpg", category: sk, user: bob)

    visit category_path(sk)

    sign_in bob

    expect(page).to have_content sk.name
    expect(page).not_to have_content pizza.name
  end
end
