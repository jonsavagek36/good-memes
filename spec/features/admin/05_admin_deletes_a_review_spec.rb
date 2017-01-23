require 'rails_helper'

feature 'deleting a review' do
  scenario 'admin views meme show page and deletes a review' do
    bob = User.create(email: "bob@123.com", password: "meme123", username: "bob")
    barb = Admin.create(email: "youknowitbarb@bigbarb.com", password: "bigbarb", username: "littlebarb")
    sk = Category.create(name: "Sucess Kid", image_url: "http://cdn-aws-01.mummypages.co.uk/images/3788/189/9/1_1/kid.jpg")
    fri = Meme.create(name: "It's Friday", img_url: "http://i.dailymail.co.uk/i/pix/2016/03/18/17/32570AD700000578-3498922-image-a-73_1458323147637.jpg", category: sk, user: bob)
    review = Review.create(rating: 3, body: "You always earned pizza!", user: bob, meme: fri)
    meanie = Review.create(rating: 3, body: "You always earned pizza!", user: bob, meme: fri)


    sign_in barb

    visit category_path(sk)

    click_on fri

    click_on "Delete Review"

    click_on "Yes"

    expect(page).to_not have_content(review.rating)
    expect(page).to_not have_content(review.body)
    expect(page).to have_content(meanie.rating)
    expect(page).to have_content(meanie.body)
    expect(page).to have_xpath("//img[contains(@src,fri.img_url)]")

  end
end
