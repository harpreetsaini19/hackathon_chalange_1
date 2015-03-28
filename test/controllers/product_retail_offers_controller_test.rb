require 'test_helper'

class ProductRetailOffersControllerTest < ActionController::TestCase
  setup do
    @product_retail_offer = product_retail_offers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:product_retail_offers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product_retail_offer" do
    assert_difference('ProductRetailOffer.count') do
      post :create, product_retail_offer: { base_price: @product_retail_offer.base_price, discounted_price: @product_retail_offer.discounted_price, expiry: @product_retail_offer.expiry, offer: @product_retail_offer.offer, product_retail_id: @product_retail_offer.product_retail_id }
    end

    assert_redirected_to product_retail_offer_path(assigns(:product_retail_offer))
  end

  test "should show product_retail_offer" do
    get :show, id: @product_retail_offer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product_retail_offer
    assert_response :success
  end

  test "should update product_retail_offer" do
    patch :update, id: @product_retail_offer, product_retail_offer: { base_price: @product_retail_offer.base_price, discounted_price: @product_retail_offer.discounted_price, expiry: @product_retail_offer.expiry, offer: @product_retail_offer.offer, product_retail_id: @product_retail_offer.product_retail_id }
    assert_redirected_to product_retail_offer_path(assigns(:product_retail_offer))
  end

  test "should destroy product_retail_offer" do
    assert_difference('ProductRetailOffer.count', -1) do
      delete :destroy, id: @product_retail_offer
    end

    assert_redirected_to product_retail_offers_path
  end
end
