class Api::V1::PurchaseProductsController < ApplicationController

  def new
    @purchase_product = PurchaseProduct.new()
  end
  
  def create
    purchases = get_purchase_products_params
    PurchaseProduct.create(purchases.map { |purchase| { purchase: purchase } })
  end

  def index
    @purchase_products = PurchaseProduct.where(purchases_id: params[:purchase_id])
    if @purchase_products
      products_ids = @purchase_products.pluck(:products_id)
      products = Product.where(id: products_ids)
      render json: products
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
