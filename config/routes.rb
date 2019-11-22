Rails.application.routes.draw do
  root 'home#index'

  resources :download_pdf, only: %i(index)
end
