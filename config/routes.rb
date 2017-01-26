Rails.application.routes.draw do

  root "categories#index"

  post "/archive_user", to: "users#archive_user"


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

  # resources :users, :only =>[:show, :index]

  devise_for :users
  resources :users, only: [:show]
  scope "/admin" do
    resources :users, only: [:index, :destroy]
  end
end
