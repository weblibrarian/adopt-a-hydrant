AdoptAThing::Application.routes.draw do
  match "/CARA", to: "static_pages#CARA", via: "get"
  match "/CIAR4", to: "static_pages#CIAR4", via: "get"
  match "/LEVU", to: "static_pages#LEVU", via: "get"
  match "/LUPOP4", to: "static_pages#LUPOP4", via: "get"
  match "/MEAL12", to: "static_pages#MEAL12", via: "get"
  match "/MEOF", to: "static_pages#MEOF", via: "get"
  match "/PRPA5", to: "static_pages#PRPA5", via: "get"
  match "/PRVI", to: "static_pages#PRVI", via: "get"
  match "/SOAR2", to: "static_pages#SOAR2", via: "get"
  match "/TAVU", to: "static_pages#TAVU", via: "get"
  match "/VICRC", to: "static_pages#VICRC", via: "get"

  devise_for :users, :controllers => {
    passwords: 'passwords',
    registrations: 'users',
    sessions: 'sessions',
  }

  get '/address', to: 'addresses#show', as: 'address'
  get '/info_window', to:'info_window#index', as: 'info_window'
  get '/sitemap', to: 'sitemaps#index', as: 'sitemap'

  scope '/sidebar', controller: :sidebar do
    get :search, as: 'search'
    get :combo_form, as: 'combo_form'
    get :edit_profile , as: 'edit_profile'
  end

  resource :reminders
  resource :things
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to: 'main#index'
end
