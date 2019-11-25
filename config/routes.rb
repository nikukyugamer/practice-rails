Rails.application.routes.draw do
  root 'home#index'

  resources :users, only: %i[index create]
  resources :home, only: %i(index create)
  resources :download_pdf, only: %i(index)
end
