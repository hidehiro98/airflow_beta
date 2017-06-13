Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get 'styleguide', to: 'pages#styleguide'

  namespace :requests do
    resources :sent_requests, :received_requests, only: :index
  end

  resources :requests, except: [:index] do
    resources :comments, only: :create

    member do
      patch 'accept', to: 'receivers#accept'
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
