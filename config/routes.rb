Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  get '/api/test', to: 'application#test'
  post '/signup', to: 'users#create'
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
  get 'login_status', to: 'user_sessions#show'
  
  
  # shop
  namespace :shop do
    get 'home/index'
    get 'top', to: 'top#index'
    get 'shop_info', to: 'shops#show'
    put 'shop_info', to: 'shops#update'

    resources :users, only: [:index, :create, :show, :update, :destroy]
    resources :customers, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
      resources :keeped_bottles, only: [:new, :create, :show, :edit, :update, :destroy]
    end
    resources :bottles, only: [:index, :new, :create, :show, :edit, :update, :destroy]
    resources :keeped_bottles, only: [:index]

    # resources :keeped_bottles, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  end


  # Defines the root path route ("/")
  # root "posts#index"
end
