Rails.application.routes.draw do
  resources :users, except: %i[create delete]
  resources :questions, only: :create

  root to: 'users#index'
end
