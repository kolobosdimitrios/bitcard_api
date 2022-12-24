class Api::V1::PurchasesController < ApplicationController

  def create
    @purchase = Purchase.new(purchase_params)
    if @purchase.save
      render json: {
        "status_code": 1,
        "description": "purchase created",
        "data": @purchase
      }
    else
      render json: {
        "status_code": -1,
        "description": "purchase cannot be saved",
        "data": []
      }
    end
  end

  def index
    user = User.find(params[:user_id])
    if user
      token = Token.find(params[:token_id])
      if token && token.user_id = token.id
        @purchases = Purchase.where(tokens_id: token.id)
        if @purchases
          render json: @purchases
        end
      end
    end
  end

  def show

    @purchase = Purchase.where(token_id: params[:token_id], purchase_id: params[:purchase_id])
    if @purchase
      render json: @purchase
    else
      render json: {
        "status_code": -1,
        "description": "purchase not found",
        "data": []
      }
    end

  end

  def destroy

  end

  def update

  end

  def purchase_params
    params.require(:purchase).permit(:tokens_id, :products_id)
  end
end
