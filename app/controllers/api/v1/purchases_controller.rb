class Api::V1::PurchasesController < ApplicationController
  def create

    puts(user_id_param)
    user = User.find_by!(user_id_param)

    begin
      purchase = Purchase.new(
        purchase_params_create
      )
      purchase.user_id = user.id
      purchase.save
      successResponse purchase
    rescue ActiveRecord::RecordNotUnique
      errorResponse
    rescue ActiveRecord::NotNullViolation
      errorResponse
    end

  end

  def index
  end

  def show
    puts user_id_param
    begin
      user = User.find_by!(user_id_param)
      successResponse user.purchases
    rescue ActiveRecord::RecordNotFound
      errorResponse
    end
  end

  def destroy
  end

  def user_id_param
    params.require(:purchase)
    .permit(
      :user_id
    )
  end

  def purchase_params_create
    params.require(:purchase)
    .permit(
      :price,
      :time,
      :pay_method
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
