Rails.application.routes.draw do

  root "categories#index"

  resources :categories, except: [:edit] do
    resources :memes, except: [:edit, :index]
  end

  resources :memes, only: [:show] do
    resource :reviews, except: [:edit, :show, :index]
  end

  namespace :api do
    namespace :v1 do
      resources :categories, only: [:index, :show, :create] do
        resources :memes, only: [:show, :create]
      end
      resources :memes, only: [:show, :create] do
        resources :reviews, only: [:index, :show, :create] do
          resources :upvotes, only: [:index, :create, :destroy]
          resources :downvotes, only: [:index, :create, :destroy]
        end
      end
      resources :reviews, only: [:index, :show, :create]
    end
  end

  devise_for :users
end
