class Tag < ApplicationRecord
  TAGS = ["Réflexion Personnelle", "Croyances", "Peurs", "Audace", "Inspiration"]
  validates :type, presence: true, inclusion: { in: TAGS }
end
