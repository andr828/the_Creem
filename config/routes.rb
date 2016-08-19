Rails.application.routes.draw do

  # Generic routes
  root 'landings#index'

  #============================================================
  # Devise User & Admin Configuration
  #============================================================
  # Main devise configuration
  # TODO: add comments here documenting the configurations.
  devise_for :users, {
    path_prefix: 'auth',
    controllers: {
      registrations: "auth/registrations",
      sessions: "auth/sessions",
      passwords: "auth/passwords",
    }
  }
  # Admin devise configuration
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)


  #============================================================
  # JPI V1
  #============================================================
  namespace :creem do
    namespace :jpi do
      namespace :v1 do
        resources :entities, only: [:index]
        resources :candidate
        resources :employer
      end
    end
  end
end
