Rails.application.routes.draw do
  get 'groups/index'
  get 'groups/show'
  get 'groups/new'
  get 'groups/create'
  get 'groups/update'
  get 'groups/edit'
  get 'groups/destroy'
  get 'events/index'
  get 'events/show'
  devise_for :users
  root to: 'pages#home'

  resources :events, only: [:index, :show]
  resources :groups
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
