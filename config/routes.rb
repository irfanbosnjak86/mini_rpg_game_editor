Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :character_types
  resources :character_attributes, except: [:index, :show]

  root "character_types#index"
end
