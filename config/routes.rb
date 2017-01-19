Rails.application.routes.draw do

  resources :categories do
    resources :memes do
      resources :reviews
    end
  end

  root "categories#index"

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
