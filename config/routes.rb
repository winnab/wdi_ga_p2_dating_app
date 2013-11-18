WdiGaP2DatingApp::Application.routes.draw do
  devise_for :users, :controllers => { :registrations => 'registrations' }
 # careful! call devise_for once only and do it before resource users!

  resources :users do
    member do
      get   'star',     :to => "user#star"
      get   'unstar',   :to => "user#unstar"
      #flag/unflag
      #poke
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

  #DELETE THIS. THE CODE IN USERS/BLAH.HTML.HAML IS FOR USERS#SHOW
  get   'blah',            :to => "users#blah"


end
