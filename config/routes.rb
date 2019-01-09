Rails.application.routes.draw do
  get 'scores/update'
  get 'pages/index'
  root to: 'pages#index'

  resources :words
  post 'activities/check_result'
  devise_for :users
  resources :activities
  resources :scores
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
