Rails.application.routes.draw do
  devise_for :users, path: 'auth', path_names: {sign_in: 'login'},controllers: {registrations: 'users/registrations', omniauth_callbacks: 'users/callbacks'}
  root 'pages#home'

  devise_scope :user do
    get '/signup', to: 'users/registrations#new'
  end
  
  namespace :admin do
    get 'dashboard', to: 'pages#dashboard'
  end

  # get 'sign_up', to: 'users#new'
  # post 'sign_up', to: 'users#create', as: 'users'

  # get 'sign_in', to: 'sessions#new'
  # post 'sign_in', to: 'sessions#create'
  # get 'sign_out', to: 'sessions#destroy'
end
