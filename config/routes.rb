Rails.application.routes.draw do
  devise_for :users
  root 'pages#home'

  get 'styleguide', to: 'pages#styleguide'

  namespace :requests do
    resources :sent_requests, only: :index do
      collection do
        get 'closed', to: 'sent_requests#closed'
      end
    end
    resources :received_requests, only: :index do
      collection do
        get 'replied', to: 'received_requests#replied'
      end
    end
  end

  resources :requests, except: :index do
    resources :comments, only: :create

    member do
      patch 'accept', to: 'receivers#accept'
      patch 'reject', to: 'receivers#reject'
      patch 'cancel', to: 'requests#cancel'
    end
  end

  resource :profile, only: [:show, :edit, :update]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
