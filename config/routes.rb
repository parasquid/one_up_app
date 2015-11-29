Rails.application.routes.draw do
  resource :users, only: [:index, :create]

  root to: 'users#index'
end
