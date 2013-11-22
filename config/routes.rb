WdiGaP2DatingApp::Application.routes.draw do
  devise_for :users,
  :controllers => { :registrations => 'users/registrations' }
  # careful! call devise_for once only and do it before resource users!

  resources :users do
    member do
      get ':event_type/:event_action', :to => "users#do_event"
    end
  end

  root :to => "home#index" # req for devise config

  resources :messages, only: [:create, :destroy]

  get   'conversation/:id',   :to => "messages#conversation",  :as => "conversation"
  get   'dashboard',          :to => "users#dashboard"
  get   'inbox',              :to => "messages#inbox"
  get   'account',            :to => "users#update_account"
  get   'profile',            :to => "users#update_profile"
  get   'looking-for',        :to => "users#looking_for",       :as => "looking_for"

  get   'search',             :to => "users#new_search"
  post  'search',             :to => "users#do_search",         :as => "do_search"

  get 'pages/about',          :to => "pages#about"
  
  # unless Rails.application.config.consider_all_requests_local
  # match '*not_found', to: 'errors#error_404'
  # end
end
