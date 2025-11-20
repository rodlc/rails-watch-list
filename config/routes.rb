Rails.application.routes.draw do
  resources :lists, only: [:index, :show, :new, :create] do
    # Imbrication : on a besoin de l'ID de la liste pour créer un bookmark
    resources :bookmarks, only: [:new, :create]
  end
  
  # Pas d'imbrication : l'ID du bookmark suffit pour le supprimer
  resources :bookmarks, only: [:destroy]
end
  