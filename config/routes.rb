Rails.application.routes.draw do
  root "categories#index"
  devise_for :users

  resources :memes
end
