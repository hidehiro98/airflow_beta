Rails.application.routes.draw do
  devise_for :users
  root 'pages#home'

  get 'styleguide', to: 'pages#styleguide'

  namespace :requests do
    get 'sent', to: 'sent_requests#index'
    get 'sent/closed', to: 'sent_requests#closed'

    get 'received', to: 'received_requests#index'
    get 'received/replied', to: 'received_requests#replied'
  end

  resources :requests, except: :index do
    resources :comments, only: :create

    member do
      patch 'accept', to: 'receivers#accept'
      patch 'reject', to: 'receivers#reject'
      patch 'cancel', to: 'requests#cancel'
      patch 'delete', to: 'requests#delete'
    end
  end

  resource :profile, only: [:show, :edit, :update]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
