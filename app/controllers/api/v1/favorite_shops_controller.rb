class Api::V1::FavoriteShopsController < ApplicationController

    def new
        @favorite_shop = FavoriteShop.new
    end

    def create
        @favorite_shop = FavoriteShop.create(get_params)
        if @favorite_shop
            render json: @favorite_shop
        end
    end

    def index
        @favorite_shops = FavoriteShop.all
    end

    def show
        @favorite_shop = FavoriteShop.find(:id)
        if @favorite_shop
            render json: @favorite_shop
        end
    end

    def destroy
        @favorite_shop = FavoriteShop.find(:id)
        if @favorite_shop
            @favorite_shop.destroy
        end
    end

    def get_params
        params.require(:favorite_shop).permit(:shops_id, :users_id)
    end
    
end
