class Category < ApplicationRecord
  validates :name, presence: true, uniquiness: true
  validates :image_url, presence: true

  has_many :memes
end
