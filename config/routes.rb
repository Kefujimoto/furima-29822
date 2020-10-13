Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  get '/items', to: 'items#show'
  get '/items/id/edit', to: 'items#edit'

  resources :items, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
