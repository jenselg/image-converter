Rails.application.routes.draw do
  resources :images
  post '/editor' => 'images#editor', as: 'editor_post'
  get '/editor' => 'images#editor', as: 'editor_get'

  root 'images#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
