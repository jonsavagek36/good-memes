require 'rails_helper'

feature "user can add reviews for a meme" do
  scenario "adds a review for a meme successfully" do
    bob = User.create(email: "bob@123.com", password: "meme123", username: "bob", admin: false, id: 5)
    ek = Category.create(name: "Evil Kermit", image_url: "http://vignette1.wikia.nocookie.net/muppet/images/5/53/MMWtrailerNov20-0025.png/revision/latest?cb=20131121155320")
    pizza = Meme.create(name: "Earned Pizza", img_url: "https://thechive.files.wordpress.com/2016/11/evil-kermit-meme-dark-side-funny-memes-14.jpg?quality=85&strip=info&w=600", category: ek, user: bob)
    review = Review.create(rating: 3, body: "You always earned pizza!", user: bob, meme: pizza)

    sign_in bob
    visit meme_path(pizza)

    choose "♨️"
    fill_in "Comment:", with: "Absolute garbage"
    click_button "Submit Review"

    expect(page).to have_content "Review added successfully"
    expect(page).to have_content "1"
    expect(page).to have_content "Absolute garbage"
    expect(page).to have_content bob.username
  end

  scenario "user adds a review for a meme unsuccessfully" do
    bob = User.create(email: "bob@123.com", password: "meme123", username: "bob", admin: false, id: 5)
    ek = Category.create(name: "Evil Kermit", image_url: "http://vignette1.wikia.nocookie.net/muppet/images/5/53/MMWtrailerNov20-0025.png/revision/latest?cb=20131121155320")
    pizza = Meme.create(name: "Earned Pizza", img_url: "https://thechive.files.wordpress.com/2016/11/evil-kermit-meme-dark-side-funny-memes-14.jpg?quality=85&strip=info&w=600", category: ek, user: bob)
    review = Review.create(rating: 3, body: "You always earned pizza!", user: bob, meme: pizza)

    sign_in bob
    visit meme_path(pizza)

    click_button "Submit Review"

    expect(page).to have_content "Rating can't be blank"
  end
end
