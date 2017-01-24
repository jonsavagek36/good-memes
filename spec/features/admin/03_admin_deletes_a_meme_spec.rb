require 'rails_helper'

feature 'deleting a meme' do
  pending scenario 'admin views category show page and deletes meme' do
    bob = User.create(email: "bob@123.com", password: "meme123", username: "bob", admin: true)
    barb = User.create(email: "bob@23.com", password: "meme123", username: "barb", admin: false)
    sk = Category.create(name: "Sucess Kid", image_url: "http://cdn-aws-01.mummypages.co.uk/images/3788/189/9/1_1/kid.jpg")
    fri = Meme.create(name: "It's Friday", img_url: "http://i.dailymail.co.uk/i/pix/2016/03/18/17/32570AD700000578-3498922-image-a-73_1458323147637.jpg", category: sk, user: bob)
    ek = Category.create(name: "Evil Kermit", image_url: "http://vignette1.wikia.nocookie.net/muppet/images/5/53/MMWtrailerNov20-0025.png/revision/latest?cb=20131121155320")
    pizza = Meme.create(name: "Earned Pizza", img_url: "https://thechive.files.wordpress.com/2016/11/evil-kermit-meme-dark-side-funny-memes-14.jpg?quality=85&strip=info&w=600", category: ek, user: bob)

    sign_in bob

    visit '/'

    sk_link = find(:xpath, "//a[contains(@href, '#{sk.image_url}')]")
    click_on sk_link

    click_link('http://cdn-aws-01.mummypages.co.uk/images/3788/189/9/1_1/kid.jpg')
    click_on "Delete Meme"

    click_on "Yes"

    expect(page).to have_content(sk.name)
    expect(page).to_not have_content(fri.name)
    expect(page).to_not have_xpath("//img[contains(@src,fri.img_url)]")
    expect(page).to have_xpath("//img[contains(@src,sk.image_url)]")

  end
  pending scenario 'admin views meme page and deletes meme' do
    barb = User.create(email: "youknowitbarb@bigbarb.com", password: "bigbarb", username: "littlebarb", admin: true)
    sk = Category.create(name: "Sucess Kid", image_url: "http://cdn-aws-01.mummypages.co.uk/images/3788/189/9/1_1/kid.jpg")
    fri = Meme.create(name: "It's Friday", img_url: "http://i.dailymail.co.uk/i/pix/2016/03/18/17/32570AD700000578-3498922-image-a-73_1458323147637.jpg", category: sk, user: barb)

    sign_in barb

    visit category_path(sk)

    click_on fri

    click_on "Delete Meme"

    click_on "Yes"

    expect(page).to have_content(sk.name)
    expect(page).to_not have_content(fri.name)
    expect(page).to_not have_xpath("//img[contains(@src,fri.img_url)]")
    expect(page).to have_xpath("//img[contains(@src,sk.image_url)]")
  end
end
