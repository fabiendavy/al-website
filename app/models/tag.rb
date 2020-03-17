class Tag < ApplicationRecord
  validates :tag_type, presence: true
end
