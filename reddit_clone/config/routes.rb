Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :users, only: [:create, :new]
  resource :sessions, only: [:create, :new, :destroy]

  resources :subs, except:[:destroy] do
    resources :posts, only: [:new]
  end

  resources :posts, only: [:create, :edit, :destroy, :update, :show, :new]

  
end
