class Api::V1::ProductsController < ApplicationController
  def create
    product = Product.new(require_product_params)

    begin
      product.save
      render successResponse product
    rescue ActiveRecord::RecordNotUnique
      errorResponse
    rescue ActiveRecord::NotNullViolation
      errorResponse
    end

  end

  def index
  end

  def show

    puts require_purchase_id
    begin
      products = Product.where(purchase_id: require_purchase_id[:purchase_id])
      successResponse products
    rescue ActiveRecord::RecordNotFound
      errorResponse
    end


  end

  def destroy
  end

  def require_product_params
    params.require(:product)
    permit(
      :name,
      :value,
      :description,
      :code,
      :barcode,
      :purchase_id
    )
  end

  def require_purchase_id
    params.require(:product)
    .permit(:purchase_id)
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
