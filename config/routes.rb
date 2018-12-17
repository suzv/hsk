Rails.application.routes.draw do
  get 'activities/show'
  get 'pages/index'
  root to: 'pages#index'
  resources :words
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
