Rails.application.routes.draw do
  require "sidekiq/web"

  devise_for :users
  root to: 'pages#home'

  # resources :users do
   # resources :recruiters, only: [:new, :create]
   # end

  resources :events, only: [:index, :show] do
     collection do
      get 'categories'
    end
  end
  resources :groups do
    resources :event_users, only: [:new, :create]
    resources :votes, only: [:new, :create]
    resources :user_groups, only: [:new]
    collection do
      get 'my_groups'
    end
  end


  authenticate :user, lambda { |u| u.admin } do
    mount Sidekiq::Web => '/sidekiq'
  end
    # get 'groups/:id/join'
end
