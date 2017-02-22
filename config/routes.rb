Rails.application.routes.draw do

  #root :to => 'band#index'
  #root 'public#index'
  root 'bands#index'

  get 'show:name', :to => 'public#show'

  get 'admin', :to => 'access#menu'
  get 'access/menu'
  get 'access/login'
  get 'access/logout'
  post 'access/attempt_login'

  resources :power_users do
    member do
      get :delete
    end
  end

  resources :bands do
    member do
      get :delete
    end
  end

  resources :albums do
    member do
      get :delete
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
