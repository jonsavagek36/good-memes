class Review < ApplicationRecord
  RATINGS = [
    [1, "♨️"],
    [2, "♨️♨️"],
    [3, "♨️♨️♨️"],
    [4, "♨️♨️♨️♨️"],
    [5, "♨️♨️♨️♨️♨️"]
  ]

  validates :rating, presence: true, numericality: true, inclusion: { in: 1..5 }
  belongs_to :user
  belongs_to :meme
  has_many :upvotes
  has_many :downvotes
end
