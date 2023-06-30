class Api::V1::PurchaseProductsController < ApplicationController

  def new
    @purchase_product = PurchaseProduct.new()
  end
  
  def create
    @purchase_products = []
    save_succeded = true
    params[:purchase_products].each do |purchase_product|
      pp = PurchaseProduct.new(get_purchase_products_params(purchase_product))
      save_succeded = false unless pp.save
      @purchase_products << pp
    end

    if save_succeded
      render json: @purchase_products, status: 200
    else
      render json: @purchase_products.errors, status: 404
    end
  end

  def index
    @purchase_products = PurchaseProduct.where(purchases_id: params[:purchase_id])
    if @purchase_products
      products_ids = @purchase_products.pluck(:products_id)
      products = Product.where(id: products_ids)
      render json: products
    else
    end
  end

  def destroy
    @purchase_product = PurchaseProduct.find[:id]
    if @purchase_product
      @purchase_product.destroy
    end
  end

  def get_purchase_products_params(purchase_product)
    purchase_product.permit(:purchases_id, :products_id)
  end
end
