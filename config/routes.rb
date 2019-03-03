Rails.application.routes.draw do
  resources :convert_images, only: [:index, :show, :create]
  resources :images, only: [:index, :show, :create]
  #get '/data_generator' => 'public_pages#data_generator', as: 'data_generator'
  root 'public_pages#index'
  match '*path' => redirect('/'), via: :all
end
