# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users, path: '/'
  devise_for :admins, path: 'admins', controllers: { sessions: 'admins/sessions' }

  namespace :admins do
    get '/', to: 'home#index'
  end
end
