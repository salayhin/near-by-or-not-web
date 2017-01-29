Rails.application.routes.draw do

  devise_for :users, path_names: { sign_up: 'register' },
             controllers: {  sessions:            'sessions',
                             registrations:       'registrations',
                             passwords:           'passwords'
             }

  namespace :admin do
    get 'dashboard' => 'dashboard#index'
    resources :users
    get 'franchise_locations/search' => 'franchise_locations#search'
    post 'franchise_locations/search' => 'franchise_locations#search'
    resources :franchises
    resources :franchise_locations
  end

  mount API::Base, at: '/'
  mount GrapeSwaggerRails::Engine, at: '/documentation'

  root to: 'admin/dashboard#index'
end
