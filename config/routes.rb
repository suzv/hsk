Rails.application.routes.draw do


    devise_for :users, controllers: {
      sessions: 'users/sessions'
    }



  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'scores/update'
  get 'pages/index'
  root to: 'activities#show'

  resources :words
  post 'activities/next_check'
  
  resources :activities
  resources :scores
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
