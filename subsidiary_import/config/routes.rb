SubsidiaryImport::Application.routes.draw do

  resources :imports, only: [:index, :show, :new, :create]

  root 'imports#index'

end
