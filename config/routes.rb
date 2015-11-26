Rails.application.routes.draw do
  get 'calendar/show'

  root 'users#index'
  resources :users do
      resources :events
  end

  resource :calendar, only: [:show], controller: :calendar
end
