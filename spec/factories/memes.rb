FactoryGirl.define do
  factory :meme do
    name "Earned pizza"
    img_url "https://thechive.files.wordpress.com/2016/11/evil-kermit-meme-dark-side-funny-memes-14.jpg?quality=85&strip=info&w=600"

    association :category, factory: :author
    association :user, factory: :user
  end
end
