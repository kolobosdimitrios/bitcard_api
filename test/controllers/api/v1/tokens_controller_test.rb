require 'test_helper'

class Api::V1::TokensControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get api_v1_tokens_new_url
    assert_response :success
  end

  test "should get create" do
    get api_v1_tokens_create_url
    assert_response :success
  end

  test "should get update" do
    get api_v1_tokens_update_url
    assert_response :success
  end

  test "should get index" do
    get api_v1_tokens_index_url
    assert_response :success
  end

  test "should get destroy" do
    get api_v1_tokens_destroy_url
    assert_response :success
  end

end
