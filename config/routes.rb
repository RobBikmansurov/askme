Rails.application.routes.draw do
  resources :users
  resources :questions, except: %i[show new index]
  resource :session, only: %i[new create destroy]
  resources :tags, param: :name, only: :show

  root to: 'users#index'
end
