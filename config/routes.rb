Rails.application.routes.draw do

  devise_for :users,
    :controllers => {:registrations => 'registrations'}

  root 'dashboard#index'


  resources :contacts

  post '/add_contact' => 'contacts#create', :as => :add_contact

  # get 'debts/:owner' => 'debts#show'

  # get 'debts/new' => 'debts#new'

  # post '/debts' => 'debts#create', :as => :add_debt

  resources :debts, :only => [:new, :create, :edit, :update, :destroy]
end
