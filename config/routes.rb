Rails.application.routes.draw do
  # resources :urls


  get 'urls/index'

  get 'urls/new'

  post 'urls/create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
