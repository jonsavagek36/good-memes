require 'rails_helper'

feature "user sees list of reviews of the meme on the meme show page" do
  scenario "sees review for specific meme" do
    bob = User.create(email: "bob@123.com", password: "meme123", username: "bob", admin: false, id: 5)
    ek = Category.create(name: "Evil Kermit", image_url: "http://vignette1.wikia.nocookie.net/muppet/images/5/53/MMWtrailerNov20-0025.png/revision/latest?cb=20131121155320")
    pizza = Meme.create(name: "Earned Pizza", img_url: "https://thechive.files.wordpress.com/2016/11/evil-kermit-meme-dark-side-funny-memes-14.jpg?quality=85&strip=info&w=600", category: ek, user: bob)
    review = Review.create(rating: 3, body: "You always earned pizza!", user: bob, meme: pizza)

    sign_in bob
    visit meme_path(pizza)

    expect(page).to have_content pizza.name
    expect(page).to have_xpath("//img[contains(@src,pizza.img_url)]")
    expect(page).to have_content "Reviews of #{pizza.name}:"
    expect(page).to have_content review.rating
    expect(page).to have_content review.body
    expect(page).to have_content review.user.username
  end
end
