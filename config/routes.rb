Rails.application.routes.draw do
  resources :images
  root 'images#index'
  match '*path' => redirect('/'), via: :all
end
