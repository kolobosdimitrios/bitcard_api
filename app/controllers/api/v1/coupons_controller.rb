class Api::V1::CouponsController < ApplicationController


    def index
        @user = User.find(params[:user_id])
        @coupons = @user.coupons
        render json: @coupons
    end

    def show
        @user = User.find(params[:user_id])
        @coupon = @user.coupons.find(params[:id])
        render json:coupon
    end

    def update 
        @user = User.find(params[:user_id])
        @coupon = @user.coupons.find(params[:id])
        if @coupon && @coupon.update(permit(require_params))
            successResponse @coupon
        else
            errorResponse [], "coupon with given id not found"
        end
    end

    def destroy
        @user = User.find(params[:user_id])
        @coupon = @user.coupons.find(params[:id])
        if @coupon && @coupon.destroy
            successResponse
        else
            errorResponse [], "coupon with given id not found"
        end
    end

    def permit(coupon)
        coupon.permit(:value, :code, :redeemed, :user_id)
    end

    def require_params
        params.require(:coupon)
    end

    def errorResponse(data = [], description = "error", status_code = -1)
        render json: {
          "status_code": status_code,
          "description": description,
          "data": data
        }
      end
    
      def successResponse(data = [])
        render json: {
          "status_code": 1,
          "description": "Success",
          "data": data
        }
      end
end
