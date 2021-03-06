Rails.application.routes.draw do

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  get 'styleguide', to: 'pages#styleguide'

  unauthenticated :user do
    scope '(:locale)', locale: /ja/ do
      root 'pages#home'
    end
  end

  scope '(:locale)', locale: /ja/ do
    devise_for :users, controllers: { registrations: 'users/registrations' }

    get 'requests/received', to: 'requests/received_requests#index', as: 'user_root'

    get '/', to: redirect('/requests/received')

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
      end
    end

    resources :teams, only: [:new, :create, :show]

    resource :profile, only: [:show, :edit, :update]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
