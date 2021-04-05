Rails.application.routes.draw do
  root 'pages#home'
  
  namespace :admin do
    get 'dashboard', to: 'pages#dashboard'
  end

  get 'sign_up', to: 'users#new'
  post 'sign_up', to: 'users#create', as: 'users'
end
