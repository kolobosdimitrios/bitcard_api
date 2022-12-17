Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      get 'login', to: 'sessions#new', as: 'login'  
      get 'logout', to: 'sessions#destroy', as: 'logout'  
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
  namespace :api do
    namespace :v1 do
      post 'purchases/create'
      get 'purchases/index'
      get 'purchases/show'
      get 'purchases/destroy'
    end
  end
  namespace :api do
    namespace :v1 do
      get 'users/new'
      post 'users/create'
      get 'users/update'
      get 'users/edit'
      get 'users/destroy'
      get 'users/index'
      get 'users/show'
      get 'users/show_with_id'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.htm
end