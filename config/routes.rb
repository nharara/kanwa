Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :entries, only: %i[index new create edit update delete]

  resources :posts, only: %i[index create update delete] do
    resources :comments, only: %i[create update delete]
  end

  get "/dashboard", to: "pages#dashboard", as: :dashboard
  # Defines the root path route ("/")
  # root "articles#index"
end
