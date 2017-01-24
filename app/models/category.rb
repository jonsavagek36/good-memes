class Category < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :image_url, presence: true

  has_many :memes
  def self.search(search)
    where("name ILIKE ?", "%#{search}%")
  end
end
