class Api::V1::PurchaseProductsController < ApplicationController

  def new
    @purchase_product = PurchaseProduct.new()
  end
  
  def create
    purchases = get_purchase_products_params
    Name.create(purchases.map { |purchase| { purchase: purchase } })
  end

  def index
    purchase = Purchase.find(params[:purchase_id])
    if purchase
      @purchase_products = purchase.purchase_products
      render json: @purchase_products
    end
  end

  def destroy
    @purchase_product = PurchaseProduct.find[:id]
    if @purchase_product
      @purchase_product.destroy
    end
  end

  def get_purchase_products_params
    params.reqiure(:purchase_products).permit(purchase_products: [])[:purchase_products]
  end
end
