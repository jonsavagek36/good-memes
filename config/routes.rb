Rails.application.routes.draw do

  root "static_pages#index"

  resources :categories, except: [:edit] do
    resources :memes, except: [:edit, :index]
  end

  resources :memes, only: [:show] do
    resource :reviews, except: [:edit, :show, :index]
  end

  devise_for :users
end
