# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :admin_users
    resources :posts

    root to: "users#index"
  end

  resources :posts
  resources :audit_logs, except: %i(new, edit, destroy)

  devise_for :users, skip: %i(registrations)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "static#homepage"
end
