Rails.application.routes.draw do
  # resources :urls


  get 'urls/index'

  root 'urls#new'

  post 'urls/create'

  get 'index/:short' => 'urls#traffic_cop'

  get 'urls/index/:short' => 'urls#traffic_cop'

  get '/:short' => 'urls#traffic_cop'



end
