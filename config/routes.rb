Rails.application.routes.draw do
  # resources :urls


  get 'urls/index'

  get 'urls/new'

  post 'urls/create'

  get 'index/:id' => 'urls#traffic_cop'

  get ':id' => 'urls#traffic_cop'


end
