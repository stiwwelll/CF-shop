Rails.application.routes.draw do
  resources :products
  root 'products#index'
  get 'simple_pages/about'
  get 'simple_pages/contact'
  get 'simple_pages/index'
  resources :orders, only: [:index, :show, :create, :destroy]
end
