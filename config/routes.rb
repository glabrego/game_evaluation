Rails.application.routes.draw do
  root to: 'games#index'

  devise_for :researchers

  resources :evaluations
  resources :games
end
