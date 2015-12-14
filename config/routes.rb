Rails.application.routes.draw do
  devise_for :users
  root "static_pages#home"
  resources :authors
  resources :entries
  resources :user_applications
  namespace :admin do
    resources :users do
      member do
        get :new_user_department
        post :save_user_department
      end
    end
    resources :user_applications
    get 'import_info', to: 'import#import_info'
    get 'import', to: 'import#import'
  end
end
