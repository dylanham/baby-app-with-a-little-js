Rails.application.routes.draw do
  root 'babies#index'
  resources :babies

  get 'sign-up', to: 'sessions#new'
  post 'sign-up', to: 'sessions#create'
  get 'sign-in', to: 'authentication#new'
  post 'sign-in', to: 'authentication#create'
  get 'sign-out', to: 'authentication#destroy'
end
