Rails.application.routes.draw do

  devise_for :users,
    :controllers => {:registrations => 'registrations'}

  root 'dashboard#index'


  resources :contacts

  post '/add_contact' => 'contacts#create', :as => :add_contact
end
