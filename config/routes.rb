Rails.application.routes.draw do
  get 'home/dashboard' => 'home#dashboard'
  get 'users/index' => 'users#index'

  devise_for :users, controllers: { registrations: "registrations", sessions: "sessions" }

  devise_scope :user do
    authenticated :user do
      root :to => 'home#dashboard', as: :authenticated_root
    end
    unauthenticated :user do
      root :to => 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  resources :projects, only: [] do
    resources :todos, only: [:index, :create, :show, :update, :destroy]
  end

  resources :projects, only: [:new, :create, :show, :index]
end
