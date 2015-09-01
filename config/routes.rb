Rails.application.routes.draw do

  devise_for :users,
    :controllers => {
      :registrations => 'registrations',
      :omniauth_callbacks => 'omniauth_callbacks'
    }

  root 'debts#index', :owner => 'my'


  resources :contacts

  post '/add_contact' => 'contacts#create', :as => :add_contact

  # get 'debts/:owner' => 'debts#show'

  # get 'debts/new' => 'debts#new'

# post '/debts' => 'debts#create', :as => :add_debt

  resources :debts, :only => [:new, :create, :edit, :update, :destroy]

  get 'debts/:owner' => 'debts#index'

end
