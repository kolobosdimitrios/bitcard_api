require 'test_helper'

class CouponsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get coupons_index_url
    assert_response :success
  end

  test "should get show" do
    get coupons_show_url
    assert_response :success
  end

  test "should get create" do
    get coupons_create_url
    assert_response :success
  end

  test "should get delete" do
    get coupons_delete_url
    assert_response :success
  end

  test "should get update" do
    get coupons_update_url
    assert_response :success
  end

end
