class Bookmark < ApplicationRecord
  # Associations (générées par le 'references', mais vérifie)
  belongs_to :movie
  belongs_to :list

  # Validations
  validates :comment, length: { minimum: 6 }
  # Unicité du couple movie/list (Erreur 7)
  validates :movie_id, uniqueness: { scope: :list_id, message: "is already in the list" }
end
