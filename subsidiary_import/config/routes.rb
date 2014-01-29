SubsidiaryImport::Application.routes.draw do

  resources :imports, only: [:index, :show, :new, :create]
  resources :merchants, only: [:index, :show]
  resources :purchasers, only: [:index, :show]

  root 'imports#index'

end
