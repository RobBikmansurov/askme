Rails.application.routes.draw do
  resource :users, only: :show

  get 'show' => 'users#show'
  root to: 'users#show'
end
