Rails.application.routes.draw do

  devise_for :users, path_names: { sign_up: 'register' },
             controllers: {  sessions:            'sessions',
                             registrations:       'registrations',
                             passwords:           'passwords'
             }

  namespace :admin do
    get 'dashboard' => 'dashboard#index'
    resources :users
    resources :fuel_stations
  end

  mount API::Base, at: '/'
  mount GrapeSwaggerRails::Engine, at: '/documentation'

  root to: 'admin/dashboard#index'
end