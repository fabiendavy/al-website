class Article < ApplicationRecord
  belongs_to :author, class_name: "User", foreign_key: "user_id"
  has_many :reviews, dependent: :destroy
  has_many :article_tags
  has_many :tags, through: :article_tags
  has_rich_text :content
  
  validates :title, presence: true
  validates :image_url, presence: true
end
