Rails.application.routes.draw do
  root 'home#index'

  resources :home, only: %i(index create)
  resources :download_pdf, only: %i(index)
end
