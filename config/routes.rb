Rails.application.routes.draw do
  devise_for :users
  # resources :applications
  root 'items#index'
  # get 'items/index'
  # post "/users/sign_up"
  # resources :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
