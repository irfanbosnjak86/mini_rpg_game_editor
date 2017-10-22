Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :character_types do
    resources :character_attributes, except: [:index]
  end

  root "character_types#index"
end
