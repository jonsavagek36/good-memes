require 'rails_helper'

feature "user sees memes of category on category show page" do
  scenario "sees memes for specific category" do
    user = User.create(email: "test123@goodmemes.com")
    ek = Category.create(name: "Evil Kermit")
    pizza = Meme.create(name: "Earned Pizza", img_url: "https://thechive.files.wordpress.com/2016/11/evil-kermit-meme-dark-side-funny-memes-14.jpg?quality=85&strip=info&w=600", category: ek, user: user)

    visit category_path(ek)

    expect(page).to have_content ek.name
    expect(page).to have_content pizza.name
    expect(page).to have_xpath("//img[contains(@src,pizza.img_url)]")
    expect(page).to have_content pizza.user
  end

  scenario "does not see memes for other categories" do
    user = User.create(email: "test123@goodmemes.com")
    sk = Category.create(name: "Sucess Kid")
    fri = Meme.create(name: "It's Friday", img_url: "http://i.dailymail.co.uk/i/pix/2016/03/18/17/32570AD700000578-3498922-image-a-73_1458323147637.jpg", category: sk, user: user)

    ek = Category.create(name: "Evil Kermit")
    pizza = Meme.create(name: "Earned Pizza", img_url: "https://thechive.files.wordpress.com/2016/11/evil-kermit-meme-dark-side-funny-memes-14.jpg?quality=85&strip=info&w=600", category: ek, user: user)

    visit category_path(sk)

    expect(page).to have_content sk.name
    expect(page).to have_content fri.name
    expect(page).not_to have_xpath("//img[contains(@src,pizza.img_url)]")
    expect(page).not_to have_content pizza.name
  end
end
