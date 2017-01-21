Rails.application.routes.draw do

  root "static_pages#index"

  resources :categories, except: [:edit] do
    resources :memes, except: [:edit, :index]
  end

  resources :memes, only: [:show] do
    resource :reviews, except: [:edit, :show, :index]
  end

  namespace :api do
    namespace :v1 do
      resources :categories, only: [:index, :create]
    end
  end

  devise_for :users
end
