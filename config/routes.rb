Rails.application.routes.draw do
  
  
  namespace :api do
    namespace :v1 do
      #create and destroy tokens for a unique users
      resources :users , only: [:show] do
        resources :tokens, only: [:index]
        resources :shops, only: [:show] do
          get 'is_favorite', to: 'favorite_shops#is_users_favorite'
          delete 'remove_relation', to: 'favorite_shops#remove_relation'
        end
        resources :token, only: [:show] do
          resources :purchases, only: [:show] do
            get 'index_user_products', to: 'products#index_user_products'
          end
        end
        get 'index_users_purchases', to: 'purchases#index_users_purchases'
        resources :purchases, only: [:index]
        
        resources :coupons, only: [:index, :show, :update, :destroy]
        get 'tokens_get', to: 'tokens#get'
      end
      resources :purchases, only: [:index, :show]
    end
  end
  namespace :api do
    namespace :v1 do
      resources :favorite_shops

      resources :shops, only: [:index] do
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
      resources :users
      post 'users/login', to: 'users#login' 
      post 'users/logout', to: 'users#logout'
      post 'users/update_points', to: 'users#update_user_points'
    end
  end


  namespace :api do
    namespace :v1 do
      resources :purchase_products, only: [:create, :destroy]
      resources :purchases, only: [:show] do
        resources :purchase_products, only: [:index]
      end     
    end
  end

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.htm
end
