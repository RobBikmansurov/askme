Rails.application.routes.draw do
  resources :users, except: :destroy
  resources :questions, only: :create
  resources :sessions, only: %i[new create destroy]

  root to: 'users#index'

  get 'sign_up' => 'users#new'
  get 'log_out' => 'sessions#destroy'
  get 'log_in' => 'sessions#new'
end
