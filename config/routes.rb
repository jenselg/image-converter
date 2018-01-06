Rails.application.routes.draw do
  resources :convert_images
  resources :images
  root 'public_pages#index'
  match '*path' => redirect('/'), via: :all
end
