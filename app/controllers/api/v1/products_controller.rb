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
    user = User.find(params[:user_id])
    if user
      token = Token.find(params[:token_id])
      if token 
        purchase = Purchase.find(params[:purchase_id])
        if token.id === purchase.tokens_id
          @products = Product.where(id: purchase.products_id)
          if @products
            render json: @products
          end
        end
      end
    end
  end

  def show

    begin
      products = Product.where(purchase_id: require_purchase_id)
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
