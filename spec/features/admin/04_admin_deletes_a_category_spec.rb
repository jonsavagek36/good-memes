require 'rails_helper'

feature 'deleting a category' do
  scenario 'admin views category show page and deletes category' do
    bob = FactoryGirl.create(:user)
    barb = FactoryGirl.create(:user, email: "youknowitbarb@bigbarb.com", password: "bigbarb", username: "littlebarb", admin: true)
    sk = FactoryGirl.create(:category, name: "Sucess Kid", image_url: "http://cdn-aws-01.mummypages.co.uk/images/3788/189/9/1_1/kid.jpg")
    fri = FactoryGirl.create(:meme, name: "It's Friday", img_url: "http://i.dailymail.co.uk/i/pix/2016/03/18/17/32570AD700000578-3498922-image-a-73_1458323147637.jpg", category: sk, user: barb)
    ek = FactoryGirl.create(:category)

    num = Category.all.length

    sign_in barb

    visit '/'

    click_link("#{sk.id}")

    click_link("delete-category-#{sk.id}")

    expect(num).to equal(Category.all.length + 1)
    expect(page).to have_xpath("//img[contains(@src,ek.image_url)]")

  end
end
