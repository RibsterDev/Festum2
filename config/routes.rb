Rails.application.routes.draw do
  # get 'event_users/create'
  # get 'event_users/new'
  # get 'votes/index'
  # get 'groups/index'
  # get 'groups/show'
  # get 'groups/new'
  # get 'groups/create'
  # get 'groups/update'
  # get 'groups/edit'
  # get 'groups/destroy'
  # get 'events/index'
  # get 'events/show'
  devise_for :users
  root to: 'pages#home'

  resources :events, only: [:index, :show] do
     collection do
      get 'categories'
    end
  end
  resources :groups do
    resources :event_users, only: [:new, :create]
    resources :votes, only: [:index]
  end
  # get 'groups/:id/join'
end
