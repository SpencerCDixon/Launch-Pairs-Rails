Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users

  resources :users, only: [] do
    resource :profile, only: :show
  end


end
