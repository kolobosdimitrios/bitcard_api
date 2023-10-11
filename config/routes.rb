Rails.application.routes.draw do
  
  # Αctions index, create and show for purchases. 
  # Destroy and update actions are not supported.
  namespace :api do
    namespace :v1 do
      resources :purchases, only: [:index, :show, :create]
    end
  end

  # Αction index for a specified user's tokens
  # list all tokens of a user with the given id
  namespace :api do
    namespace :v1 do
      resources :users , only: [:show] do
        resources :tokens, only: [:index]
      end
    end
  end

  # Action is favorite and remove relation for favorite shops.
  # Those action require a user and a shop to be done.
  namespace :api do
    namespace :v1 do
      resources :users , only: [:show] do
        resources :shops, only: [:show] do
          get 'is_favorite', to: 'favorite_shops#is_users_favorite'
          delete 'remove_relation', to: 'favorite_shops#remove_relation'
        end
      end
    end
  end

  # Action to find and list all the purchases a user with the given 
  # id have done.
  namespace :api do
    namespace :v1 do
      resources :users , only: [:show] do
        get 'index_users_purchases', to: 'purchases#index_users_purchases'
      end
    end
  end

  # RESTful actions for the coupons of a user.
  namespace :api do
    namespace :v1 do
      resources :users , only: [:show] do
        resources :coupons, only: [:index, :show, :update, :destroy]
      end
    end
  end

  # Action that provides the user with the valid token every time is called.
  namespace :api do
    namespace :v1 do
      resources :users , only: [:show] do
        get 'tokens_get', to: 'tokens#get'
      end
    end
  end

  # favorite shops RESTful routes
  namespace :api do
    namespace :v1 do
      resources :favorite_shops, only: [:index, :show, :create]
    end
  end

  # route to get products for a specified shop through shops_id from parameters
  namespace :api do
    namespace :v1 do
      resources :shops, only: [:index] do
        get 'get_shop_products', to: 'products#index_shop_products'
      end
    end
  end

  # RESTful routes for products
  namespace :api do
    namespace :v1 do
      resources :products
    end
  end

  #routes for users (RESTful and login-logout-update_points)
  namespace :api do
    namespace :v1 do
      resources :users
      post 'users/login', to: 'users#login' 
      post 'users/logout', to: 'users#logout'
      post 'users/update_points', to: 'users#update_user_points'
    end
  end


  # Actions that create and destroy purchase product.
  namespace :api do
    namespace :v1 do
      resources :purchase_products, only: [:create, :destroy]    
    end
  end

  # Action that finds and lists all the products from the given purchase.
  namespace :api do
    namespace :v1 do
      resources :purchases, only: [:show] do
        resources :purchase_products, only: [:index]
      end     
    end
  end


  # Actions for shops RESTful
  namespace :api do
    namespace :v1 do
      resources :shops
    end
  end

end
