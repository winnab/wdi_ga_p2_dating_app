WdiGaP2DatingApp::Application.routes.draw do
  devise_for :users

  root :to => "home#index" # req for devise config

  devise_for :users, :controllers => { :registrations => 'users' }

  resources :messages, only: [:create, :destroy]

  resources :user do
    member do
      get   'star',   :to => "user#star"
      get   'unstar',   :to => "user#unstar"
      #flag/unflag
      #poke      
    end
  end
  
  get   'conversation/:id',   :to => "messages#conversation",  :as => "conversation"
  get   'dashboard',          :to => "users#dashboard"
  get   'inbox',              :to => "messages#inbox"  
  get   'account',            :to => "users#update_account"
  get   'profile',            :to => "users#update_profile"
  get   'looking-for',        :to => "users#looking_for",       :as => "looking_for"
          
  get   'search',             :to => "users#new_search"
  post  'search',             :to => "users#do_search",         :as => "do_search"     


end
