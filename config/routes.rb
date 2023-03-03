Rails.application.routes.draw do
  
  

  namespace :api do
    namespace :v1 do
      #create and destroy tokens for a unique users
      resources :users , only: [:show] do
        resources :tokens, only: [:index, :show] do
          resources :purchases, only: [:index] do
            get 'get_users_products', to: 'products#index_user_products'
          end
        end
        get 'tokens_get', to: 'tokens#get'
        resources :coupons
      end
    end
  end
  namespace :api do
    namespace :v1 do
      resources :shops do
        # resources :purchases, only: [:create]
        get 'get_shop_products', to: 'products#index_shop_products'
      end
    end
  end
  namespace :api do
    namespace :v1 do
      resources :products
    end
  end
  namespace :api do
    namespace :v1 do
     resources :purchases
    end
  end
  namespace :api do
    namespace :v1 do
      resources :users
      post 'users/login', to: 'users#login' 
      post 'users/logout', to: 'users#logout'
    end
  end

  # namespace :api do
  #   namespace :v1 do
  #     resources :shops      
  #   end
  # end

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.htm
end
