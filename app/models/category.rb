class Category < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :image_url, presence: true

  has_many :memes
end
