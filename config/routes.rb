Rails.application.routes.draw do
  devise_for :users
  get 'healthcheck', to: 'healthcheck#index'
end
