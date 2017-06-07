Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get 'styleguide', to: 'pages#styleguide'

  resources :requests, except: [:index]

  namespace :requests do
    resources :sent_requests, :received_requests, only: :index
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
