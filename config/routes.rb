Rails.application.routes.draw do
  
  root "pages#home"
  get 'about', to: 'pages#about'
  
  resources :account_lookups, only: [:index, :create]
  resources :users

end
