Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  authenticated :user do
    root :to => 'companies#new', as: :authenticated_root
  end
  root to: 'jobs#index'

  devise_for :users

  resources :companies do
   resources :jobs
  end

  resources :jobs do
    resources :talents
  end

  get 'home', to: "static_pages#home"
  get 'about', to: "static_pages#about"
  get 'post_job', to: "static_pages#post_job"

end
