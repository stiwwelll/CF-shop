Rails.application.routes.draw do
  resources :products
  root 'simple_pages#index'
  get 'simple_pages/about'
  get 'simple_pages/contact'
  get 'simple_pages/index'
end
