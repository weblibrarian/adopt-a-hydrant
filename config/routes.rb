AdoptAThing::Application.routes.draw do
  get "static_pages/CARA"
  get "static_pages/CIAR4"
  get "static_pages/LEVU"
  get "static_pages/LUPOP4"
  get "static_pages/MEAL12"
  get "static_pages/MEOF"
  get "static_pages/PRPA5"
  get "static_pages/PRVI"
  get "static_pages/SOAR2"
  get "static_pages/TAVU"
  get "static_pages/VICRC"

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
