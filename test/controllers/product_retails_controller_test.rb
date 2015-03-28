require 'test_helper'

class ProductRetailsControllerTest < ActionController::TestCase
  setup do
    @product_retail = product_retails(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:product_retails)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product_retail" do
    assert_difference('ProductRetail.count') do
      post :create, product_retail: { base_price: @product_retail.base_price, product_name: @product_retail.product_name, retail_name: @product_retail.retail_name }
    end

    assert_redirected_to product_retail_path(assigns(:product_retail))
  end

  test "should show product_retail" do
    get :show, id: @product_retail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product_retail
    assert_response :success
  end

  test "should update product_retail" do
    patch :update, id: @product_retail, product_retail: { base_price: @product_retail.base_price, product_name: @product_retail.product_name, retail_name: @product_retail.retail_name }
    assert_redirected_to product_retail_path(assigns(:product_retail))
  end

  test "should destroy product_retail" do
    assert_difference('ProductRetail.count', -1) do
      delete :destroy, id: @product_retail
    end

    assert_redirected_to product_retails_path
  end
end
