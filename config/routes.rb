Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'user/registrations' }
  resources :after_signup, only: [:show, :update]
  get 'static_pages/home'
  get 'static_pages/index'
  get 'static_pages/about'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "static_pages#index"
end
