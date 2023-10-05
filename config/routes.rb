Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'users/registrations' }
  root "users#index"

    resources :users, only: [:index,:sign_out, :show] do 
      resources :posts, only: [:index, :show, :create, :new] do
        resources :likes, only: [:create]
        resources :comments, only: [:create, :new]
      end
    end
end
