class Review < ApplicationRecord
  belongs_to :article

  validates :content, presence: true
  validates :rating, presence: true
end
