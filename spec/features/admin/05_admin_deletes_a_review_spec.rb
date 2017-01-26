require 'rails_helper'

feature 'deleting a review' do
  scenario 'admin views meme show page and deletes a review' do
    barb = FactoryGirl.create(:user, email: "youknowitbarb@bigbarb.com", password: "bigbarb", username: "littlebarb", admin: true)
    sk = FactoryGirl.create(:category, name: "Success Kid", image_url: "http://cdn-aws-01.mummypages.co.uk/images/3788/189/9/1_1/kid.jpg")
    fri = FactoryGirl.create(:meme, name: "It's Friday", img_url: "http://i.dailymail.co.uk/i/pix/2016/03/18/17/32570AD700000578-3498922-image-a-73_1458323147637.jpg", category: sk, user: bob = FactoryGirl.create(:user))
    review = FactoryGirl.create(:review, rating: 5, user: bob, meme: fri)
    meanie = FactoryGirl.create(:review, rating: 3, body: "You never earned pizza!", user: bob, meme: fri)

    num = Review.all.length

    sign_in barb

    visit category_path(sk)

    click_link("#{fri.id}")

    click_link("delete-#{review.id}")

    expect(num).to equal(Review.all.length + 1)
    expect(page).to_not have_content(review.body)
    expect(page).to have_content("♨️♨️♨️")
    expect(page).to have_content(meanie.body)
    expect(page).to have_xpath("//img[contains(@src,fri.img_url)]")

  end
end
