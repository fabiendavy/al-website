class Article < ApplicationRecord
  belongs_to :author, class_name: "User", foreign_key: "user_id"
  has_many :reviews, dependent: :destroy
  has_many :tags, through: :article_tags

  validates :title, presence: true
  validates :content, presence: true
end
