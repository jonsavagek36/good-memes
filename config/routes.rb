Rails.application.routes.draw do
  resources :categories do
    :memes do
      :reviews
    end
  end

  root "categories#index"
end
