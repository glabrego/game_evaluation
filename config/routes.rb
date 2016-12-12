Rails.application.routes.draw do
  resources :games
  devise_for :researchers
  root to: 'evaluations#index'
  resources :evaluations
end
