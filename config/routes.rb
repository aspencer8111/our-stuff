Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  resources :items
  root to: "items#index"
end
