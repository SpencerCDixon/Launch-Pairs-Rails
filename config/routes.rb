Rails.application.routes.draw do
  root "dashboards#show"
  devise_for :users, controllers: { registrations: "registrations" }

  resources :users, only: [] do
    resource :profile, only: [:show, :new, :create, :edit, :update]
    resources :statuses, only: [:create]
    resources :projects, only: [:create]
  end

  resource :dashboard, only: :show
  resources :pairings, only: :create
  post '/dashboard/send_flow' => "dashboards#send_flow"
end
