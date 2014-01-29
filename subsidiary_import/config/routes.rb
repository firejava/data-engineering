SubsidiaryImport::Application.routes.draw do

  root 'default#index'

  resources :imports, only: [:index, :show, :new, :create]

end
