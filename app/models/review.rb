class Review < ApplicationRecord
  validates :rating, presence: true, numericality: true, inclusion: { in: 1..5 }
  belongs_to :user
  belongs_to :meme
end
