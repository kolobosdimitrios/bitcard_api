Rails.application.routes.draw do
  
  namespace :api do
    namespace :v1 do
      #create and destroy tokens for a unique users
      resources :users , only: [:show] do
        get 'tokens/get'
      end
    end
  end
  namespace :api do
    namespace :v1 do
      get 'shops/create'
      get 'shops/index'
      get 'shops/show'
      get 'shops/destroy'
    end
  end
  namespace :api do
    namespace :v1 do
      post 'products/create'
      get 'products/index'
      get 'products/show'
      get 'products/destroy'
    end
  end
  # namespace :api do
  #   namespace :v1 do
  #     post 'purchases/create'
  #     get 'purchases/index'
  #     get 'purchases/show'
  #     get 'purchases/destroy'
  #   end
  # end
  namespace :api do
    namespace :v1 do
      resources :users
      post 'users/login', to: 'users#login' 
      post 'users/logout', to: 'users#logout'
    end
  end

  namespace :api do
    namespace :v1 do
      resources :tokens, only: [:show] do
        resources :purchases
      end
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.htm
end
