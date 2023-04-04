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

  def index_users_purchases
    user = User.find(params[:user_id])
    if user
      tokens = user.token
      @purchases = []
      tokens.each do |token| 
        @purchases << Purchase.where(tokens_id: token.id).first
      end
      if @purchases
          render json: @purchases.compact
      end
    end
  end

  def index
    @purchases = Purchase.all
    render json: @purchases
  end

  def show

    @purchase = Purchase.find(params[:id])
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
    params.require(:purchase).permit(:tokens_id, :products_id, :shops_id)
  end
end
