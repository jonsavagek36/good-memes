require 'rails_helper'

feature "user sees memes of category on category show page" do
  scenario "sees memes for specific category" do
    bob = User.create(email: "bob@123.com", password: "meme123")
    ek = Category.create(name: "Evil Kermit", image_url: "http://vignette1.wikia.nocookie.net/muppet/images/5/53/MMWtrailerNov20-0025.png/revision/latest?cb=20131121155320")
    pizza = Meme.create(name: "Earned Pizza", img_url: "https://thechive.files.wordpress.com/2016/11/evil-kermit-meme-dark-side-funny-memes-14.jpg?quality=85&strip=info&w=600", category: ek, user: bob)

    visit category_path(ek)

    expect(page).to have_content ek.name
    expect(page).to have_content pizza.name
    expect(page).to have_xpath("//img[contains(@src,pizza.img_url)]")
    expect(page).to have_content pizza.user.email
  end

  scenario "does not see memes for other categories" do
    bob = User.create(email: "bob@123.com", password: "meme123")
    sk = Category.create(name: "Sucess Kid", image_url: "http://cdn-aws-01.mummypages.co.uk/images/3788/189/9/1_1/kid.jpg")
    fri = Meme.create(name: "It's Friday", img_url: "http://i.dailymail.co.uk/i/pix/2016/03/18/17/32570AD700000578-3498922-image-a-73_1458323147637.jpg", category: sk, user: bob)
    ek = Category.create(name: "Evil Kermit", image_url: "http://vignette1.wikia.nocookie.net/muppet/images/5/53/MMWtrailerNov20-0025.png/revision/latest?cb=20131121155320")
    pizza = Meme.create(name: "Earned Pizza", img_url: "https://thechive.files.wordpress.com/2016/11/evil-kermit-meme-dark-side-funny-memes-14.jpg?quality=85&strip=info&w=600", category: ek, user: bob)

    sign_in bob

    visit category_path(sk)

    expect(page).to have_content sk.name
    expect(page).to have_content fri.name
    expect(page).not_to have_content pizza.name
  end
end