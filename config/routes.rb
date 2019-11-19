Rails.application.routes.draw do
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
  root to: 'events#home'

  resources :events, only: [:index, :show] do
     collection do
      get 'categories'
    end
  end
  resources :groups

  # get 'groups/:id/join'
end
