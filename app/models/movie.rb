class Movie < ApplicationRecord
  # Associations
  has_many :bookmarks

  # Validations
  validates :title, presence: true, uniqueness: true
  validates :overview, presence: true
  
  # Pas de 'dependent: :destroy' ici car le test 19 demande 
  # qu'on NE PUISSE PAS supprimer un film s'il a des bookmarks.
  # Rails lèvera une erreur de contrainte de clé étrangère par défaut, ce qui valide le test.
end
