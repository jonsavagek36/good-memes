require 'rails_helper'

feature 'deleting a meme' do
  scenario 'admin views category show page and deletes meme' do

    bob = FactoryGirl.create(:user, admin: true)
    barb = FactoryGirl.create(:user, email: "bob@23.com", password: "meme123", username: "barb", admin: false)
    sk = FactoryGirl.create(:category, name: "Sucess Kid", image_url: "http://cdn-aws-01.mummypages.co.uk/images/3788/189/9/1_1/kid.jpg")
    fri = FactoryGirl.create(:meme, name: "It's Friday", img_url: "http://i.dailymail.co.uk/i/pix/2016/03/18/17/32570AD700000578-3498922-image-a-73_1458323147637.jpg", category: sk, user: bob)
    ek = FactoryGirl.create(:category)
    pizza = FactoryGirl.create(:meme, category: ek, user: bob)

    sign_in bob

    visit '/'
    click_link("#{sk.id}")

    click_link("delete-meme-#{fri.id}")

    expect(page).to have_content(sk.name)
    expect(page).to have_content("Meme Deleted!")
    expect(page).to_not have_content(fri.name)
    expect(page).to have_xpath("//img[contains(@src,sk.image_url)]")

  end
  scenario 'admin views meme page and deletes meme' do
    barb = FactoryGirl.create(:user, email: "youknowitbarb@bigbarb.com", password: "bigbarb", username: "littlebarb", admin: true)
    sk = FactoryGirl.create(:category, name: "Sucess Kid", image_url: "http://cdn-aws-01.mummypages.co.uk/images/3788/189/9/1_1/kid.jpg")
    fri = FactoryGirl.create(:meme, name: "It's Friday", img_url: "http://i.dailymail.co.uk/i/pix/2016/03/18/17/32570AD700000578-3498922-image-a-73_1458323147637.jpg", category: sk, user: barb)


    sign_in barb

    visit category_path(sk)

    click_link("delete-meme-#{fri.id}")

    expect(page).to have_content(sk.name)
    expect(page).to have_content("Meme Deleted!")
    expect(page).to_not have_content(fri.name)
    expect(page).to have_xpath("//img[contains(@src,sk.image_url)]")
  end
end
