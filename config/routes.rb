Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  authenticated :user do
    root :to => 'companies#new', as: :authenticated_root
  end
  root to: 'jobs#index'

  devise_for :users

  resources :companies do
   resources :jobs
  end

  resources :jobs
end
