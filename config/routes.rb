# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users, path: '/'
  devise_for :admins, path: 'admins', controllers: { sessions: 'admins/sessions' }
  resources :pantry_items

  namespace :admins do
    get '/', to: 'home#index'
    resources :categories do
      resources :products, only: %i[create update edit new destroy]
    end
  end
end
