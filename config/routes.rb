Rails.application.routes.draw do
  
  root "pages#home"
  get 'about', to: 'pages#about'
  
  resource :account_lookups, only: [:new]
  
end
