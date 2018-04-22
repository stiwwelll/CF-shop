Rails.application.routes.draw do
  resources :products
  root 'simple_pages#landing_page'
  get 'simple_pages/about'
  get 'simple_pages/contact'
  get 'simple_pages/index'
  post 'simple_pages/thank_you'
  resources :orders, only: [:index, :show, :create, :destroy]
end
