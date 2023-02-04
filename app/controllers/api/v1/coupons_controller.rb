class Api::V1::CouponsController < ApplicationController
  
  def index
    @coupons = Coupon.where(user_id: params(:user_id))
    if @coupons
      render json :@coupons
    end
  end

  def show
    @coupon = Coupon.where(user_id: params(:user_id), id: params(:id))
    if @coupon
      render json: @coupon
    end
  end

  def create
    @coupon = Coupon.new(coupon_params)
    begin
      @coupon.save
      render successResponse @coupon
    rescue ActiveRecord::RecordNotUnique
      errorResponse
    rescue ActiveRecord::NotNullViolation
      errorResponse
    end
  end

  def destroy
    @coupon = Coupon.where(user_id: params(:user_id), id: params(:id))
    if @coupon
      if @coupon.destroy
        successResponse "coupon destroyed"
      else
        errorResponse "coupon cannot be destroyed"
      end
    else
      errorResponse "coupon cannot be found"
    end
  end

  def update
    @coupon = Coupon.where(user_id: params(:user_id), id: params(:id))
    if @coupon.update(coupon_params)
      # handle a successful update, such as redirecting to a show page
      successResponse
    else
      # handle a failed update, such as rendering the edit page again
      errorResponse [], "user with the given id not found"
    end
  end

  def coupon_params
    params.require(:coupon).permit(
      :value,
      :points,
      :barcode_value,
      :is_completed,
      :is_redeemed,
      :user_id
    )
  end

  def errorResponse(data = [])
    render json: {
      "status_code": -1,
      "description": "Error while saving-creating user",
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
