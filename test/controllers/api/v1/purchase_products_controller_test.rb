require 'test_helper'

class Api::V1::PurchaseProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get api_v1_purchase_products_create_url
    assert_response :success
  end

  test "should get index" do
    get api_v1_purchase_products_index_url
    assert_response :success
  end

  test "should get update" do
    get api_v1_purchase_products_update_url
    assert_response :success
  end

  test "should get show" do
    get api_v1_purchase_products_show_url
    assert_response :success
  end

  test "should get destroy" do
    get api_v1_purchase_products_destroy_url
    assert_response :success
  end

end
