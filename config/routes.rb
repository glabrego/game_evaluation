Rails.application.routes.draw do
  root to: 'evaluations#index'
  resources :evaluations
end
