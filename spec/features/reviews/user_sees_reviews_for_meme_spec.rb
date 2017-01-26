
feature "user sees list of reviews of the meme on the meme show page" do
  scenario "sees review for specific meme" do
    bob = FactoryGirl.create(:user)
    ek = FactoryGirl.create(:category)
    pizza = FactoryGirl.create(:meme, category: ek, user: bob)
    review = FactoryGirl.create(:review, meme: pizza, user: bob)

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
