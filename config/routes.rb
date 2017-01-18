Rails.application.routes.draw do

  resources :categories do
    resource :memes do
      :reviews
    end
  end
    root "categories#index"

    devise_for :users
end
