Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/contestants', to: 'contestants#index'
  get '/projects/:id', to: 'projects#show'

end
