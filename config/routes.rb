Rails.application.routes.draw do
  root to: 'games#index'

  devise_for :researchers, controllers: { registrations: 'registrations' }

  resources :evaluations
  resources :games
end
