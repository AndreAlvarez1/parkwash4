Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'users/show'
  get 'washers/show'
  root to: 'pages#index'

  get 'pages/index_washers'

  get 'vehicles/index_all', to: 'vehicles#index_all'
  get 'washes/index_all', to: 'washes#index_all'
  get 'receipts/index_all', to: 'receipts#index_all'

  get 'vehicles/new', to: 'vehicles#new'
  get 'washes/new', to: 'washes#new'
  get 'receipts/new', to: 'receipts#new'

  resources :prices
  resources :reconciliations
  resources :credit_notes
  resources :payments

  resources :vehicle_sizes
  resources :wash_types
  resources :places

  devise_for :users, controllers: {
          registrations: 'users/registrations',
          omniauth_callbacks: 'users/omniauth_callbacks',
          sessions: 'users/sessions'
        }

  devise_for :washers, controllers: {
          registrations: 'washers/registrations',
          sessions: 'washers/sessions'
        }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :washers, only: [:index, :show]
  resources :users, only: [:index, :show] do
    resources :vehicles
    resources :washes
    resources :receipts
  end


end
