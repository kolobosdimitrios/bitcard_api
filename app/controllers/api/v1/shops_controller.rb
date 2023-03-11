class Api::V1::ShopsController < ApplicationController
  
  def create
    @shop = Shop.new(purchase_params)
    if @shop.save
      render json: @shop
    else
      render json: {
        "status_code": -1,
        "description": "shop cannot be created",
        "data": []
      }
    end
  end

  def index
    @shops = Shop.all
    if(@shops)
      render json: @shops
    else
      render json: {
        "status_code": -1,
        "description": "no shops found",
        "data": []
      }
    end
  end

  def show
    @shop = Shop.find(params[:id])
    if(@shop)
      render json: @shop
    else
      render json: {
        "status_code": -1,
        "description": "shop with given id not found",
        "data": []
      }
    end
  end

  def destroy

  end

  def update
    @shop = Shop.find(params[:id])
    if @shop.update(shop_params)
      # handle a successful update, such as redirecting to a show page
      render json: @shop
    else
      # handle a failed update, such as rendering the edit page again
      render json: {
        "status_code": -1,
        "description": "cannot update shop",
        "data": []
      }
    end
  end

  def shop_params
    params.require(:shop).permit(:shop_name, :location_name, :location_latitude, :location_longitude,:description, :location_address, :working_hours)
  end
end
