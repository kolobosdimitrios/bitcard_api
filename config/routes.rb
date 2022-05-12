Rails.application.routes.draw do
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
