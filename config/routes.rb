Rails.application.routes.draw do
  resources :users
  resources :questions, except: %i[show new index]
  resources :sessions, only: %i[new create destroy]
  resources :tags, param: :name, only: :show

  root to: 'users#index'

  get 'sign_up' => 'users#new'
  get 'log_out' => 'sessions#destroy'
  get 'log_in' => 'sessions#new'
end
