Rails.application.routes.draw do
  devise_for :users
  get 'pages/index'
  root 'pages#landing_page'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
