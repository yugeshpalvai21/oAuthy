Rails.application.routes.draw do
  root 'pages#home'
  namespace :admin do
    get 'dashboard', to: 'admins#dashboard'
  end
end
