class List < ApplicationRecord
  # Associations
  # "dependent: :destroy" est crucial pour l'erreur 13
  has_many :bookmarks, dependent: :destroy 
  has_many :movies, through: :bookmarks

  # Validations
  validates :name, presence: true, uniqueness: true
end
