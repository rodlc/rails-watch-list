Rails.application.routes.draw do
  # Définit la page d'accueil sur la liste des listes
  root to: "lists#index" 

  resources :lists, only: [:index, :show, :new, :create] do
    resources :bookmarks, only: [:new, :create]
  end
  resources :bookmarks, only: [:destroy]
end
