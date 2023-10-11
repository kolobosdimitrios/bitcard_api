class Api::V1::FavoriteShopsController < ApplicationController

    def new
        @favorite_shop = FavoriteShop.new
    end

    def create
        @favorite_shop = FavoriteShop.create(post_params)
        if @favorite_shop.id
            success_response
        else
            error_response [], "relation already exists!", -1
        end
    end

    def index
        @favorite_shops = FavoriteShop.all
        render json: @favorite_shops
    end

    def show
        @favorite_shop = FavoriteShop.find(:id)
        if @favorite_shop
            render json: @favorite_shop
        end
    end

    def remove_relation
        @favorite_shop = FavoriteShop.find_by(user_id: permitted_params[:user_id], shop_id: permitted_params[:shop_id])
        if @favorite_shop.destroy
            success_response
        else
            error_response  
        end
    end

    def is_users_favorite
        @favorite_shop = FavoriteShop.find_by(user_id: permitted_params[:user_id], shop_id: permitted_params[:shop_id])
        if @favorite_shop
            success_response @favorite_shop
        else
            error_response [], "shop not user's favorite or shop not exists", -1
        end
        
    end

    def post_params
        params.require(:favorite_shop).permit(:shop_id, :user_id)
    end

    def permitted_params
        params.permit(:shop_id, :user_id)
    end

    def error_response(data = [], description = "error", status_code = -1)
        render json: {
        "status_code": status_code,
        "description": description,
        "data": data
        }
    end

    def success_response(data = [])
        render json: {
        "status_code": 1,
        "description": "Success",
        "data": data
        }
    end
    
end
