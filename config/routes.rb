Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users, controllers: { registrations: "registrations" }

  resources :users, only: [] do
    resource :profile, only: :show
    resources :statuses, only: [:create]
    resources :projects, only: [:create]
  end

  resource :dashboard, only: :show
  resources :pairings, only: :create
end
