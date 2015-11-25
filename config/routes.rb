Rails.application.routes.draw do
  root :to => ''
  resources :users
  resources :events
end
