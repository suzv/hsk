Rails.application.routes.draw do


    devise_for :users, controllers: {
      sessions: 'users/sessions'
    }



  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'scores/update'
  get 'activities/calendar',to: "activities#calendar"
  get 'pages/index'
  root to: 'pages#index'

  resources :words
  post 'activities/next_check'
  get 'activities/finish'
  resources :activities
  resources :scores
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
