class Meme < ApplicationRecord
  validates :name, presence: true
  validates :img_url, presence: true

  belongs_to :category
  belongs_to :user
  has_many :reviews
end
