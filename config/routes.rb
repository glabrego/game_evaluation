Rails.application.routes.draw do
  devise_for :researchers
  root to: 'evaluations#index'
  resources :evaluations
end
