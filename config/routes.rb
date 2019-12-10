Rails.application.routes.draw do

root :to => "products#index"

  get 'pages/home'
  get 'line_items/index'
  get 'line_items/show'
  get 'line_items/edit'
  get 'line_items/new'
  get 'orders/index'
  get 'orders/show'
  get 'orders/edit'
  get 'orders/new'
  get 'products/index'
  get 'products/:id' => 'products#show'
  get 'products/edit'
  get 'products/new'
  get 'users/index'
  get 'users/show'
  get 'users/edit'
  get 'users/new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
