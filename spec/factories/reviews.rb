FactoryGirl.define do
  factory :review do
    rating 3
    body "You always earned pizza!"

    association :meme, factory: :meme
    association :user, factory: :user
  end
end
