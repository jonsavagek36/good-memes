FactoryGirl.define do
  factory :user do
    email "bob@123.com"
    password "meme123"
    username "bob"
    admin false
  end
end
