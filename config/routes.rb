Rails.application.routes.draw do
  root 'users#index'
  resources :users do
      resources :events
  end

  resources :sessions, :only => [:new, :create]

  delete "/logout", to: "sessions#destroy", as: :logout
end
