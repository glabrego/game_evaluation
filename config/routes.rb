# frozen_string_literal: true
Rails.application.routes.draw do
  root to: 'games#index'

  devise_for :researchers, controllers: { registrations: 'registrations' }

  resources :games do
    resources :evaluations, only: [:new, :create, :index, :show]
  end
end
