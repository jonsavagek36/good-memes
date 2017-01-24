require 'rails_helper'

feature 'deleting a category' do
  pending scenario 'admin views category show page and deletes category' do
    bob = User.create(email: "bob@123.com", password: "meme123", username: "bob", admin: false)
    barb = User.create(email: "youknowitbarb@bigbarb.com", password: "bigbarb", username: "littlebarb", admin: true)
    sk = Category.create(name: "Sucess Kid", image_url: "http://cdn-aws-01.mummypages.co.uk/images/3788/189/9/1_1/kid.jpg")
    fri = Meme.create(name: "It's Friday", img_url: "http://i.dailymail.co.uk/i/pix/2016/03/18/17/32570AD700000578-3498922-image-a-73_1458323147637.jpg", category: sk, user: barb)
    ek = Category.create(name: "Evil Kermit", image_url: "http://vignette1.wikia.nocookie.net/muppet/images/5/53/MMWtrailerNov20-0025.png/revision/latest?cb=20131121155320")

    sign_in barb

    visit '/'

    click_on sk

    click_on "Delete Category"

    expect(page).to_not have_content(sk.name)
    expect(page).to_not have_content(fri.name)
    expect(page).to_not have_xpath("//img[contains(@src,fri.img_url)]")
    expect(page).to_not have_xpath("//img[contains(@src,sk.image_url)]")
    expect(page).to have_xpath("//img[contains(@src,ek.image_url)]")

  end
end
