Rails.application.routes.draw do

  devise_for :users, path_names: { sign_up: 'register' },
             controllers: {  sessions:            'sessions',
                             registrations:       'registrations',
                             passwords:           'passwords'
             }

  namespace :admin do
    get 'dashboard' => 'dashboard#index'
    resources :users
    #get 'franchise_locations/search' => 'franchise_locations#search'
    #post 'franchise_locations/search' => 'franchise_locations#search'

    resources :franchises do
      get 'all_locations' => 'franchise_locations#all_location_by_franchise_id'
    end
    resources :franchise_locations
  end

  get '/search' => 'home#search'
  post '/search' => 'home#search'

  mount API::Base, at: '/'
  mount GrapeSwaggerRails::Engine, at: '/documentation'

  #root to: 'admin/dashboard#index'
  root to: 'home#search'
end
