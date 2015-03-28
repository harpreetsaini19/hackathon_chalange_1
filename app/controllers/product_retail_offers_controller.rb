class ProductRetailOffersController < ApplicationController
  before_action :set_product_retail_offer, only: [:show, :edit, :update, :destroy]
  NOT_EXIST = "This product does not exist"
  OFFER_NOT_VALID = "This offer is not valid"

  # GET /product_retail_offers/new
  def new
    @product_retail_offer = ProductRetailOffer.new
    @valid_offers = valid_offers
    @product_retail = ProductRetail.find_by_id(params[:product_retail_id])
    if !@product_retail
      redirect_to product_retails_path, alert: NOT_EXIST
    end
  end

  def index
    @product_retail = ProductRetail.find_by_id(params[:product_retail_id])
    if @product_retail
      @product_retail_offers = @product_retail.product_retail_offers
    else
      redirect_to product_retails_path, alert: NOT_EXIST
    end
  end

  # POST /product_retail_offers
  # POST /product_retail_offers.json
  def create
    @product_retail_offer = ProductRetailOffer.new(product_retail_offer_params)
    discounted_price, offer = return_price(@product_retail_offer.base_price,@product_retail_offer.offer)
    if ! discounted_price
      redirect_to add_product_retail_offers_path(params[:product_retail_id]), alert: OFFER_NOT_VALID and return
    end
    @product_retail_offer.discounted_price = discounted_price
    @product_retail_offer.offer = offer
    @product_retail_offer.save
    redirect_to view_product_retail_offers_path(params[:product_retail_id])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_retail_offer
      @product_retail_offer = ProductRetailOffer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_retail_offer_params
      params.require(:product_retail_offer).permit(:base_price,:product_retail_id,:offer)
    end

    def valid_offers
      valid_offers = {
        "1" => "10% off.",
        "2" => "Flat 250 off."
      }
      return valid_offers
    end

    def return_price(base_price,applied_offer)
      offers = valid_offers
      case applied_offer.to_i
      when 1
        discounted_price = (base_price.to_f - (10*base_price).to_f/100).round(2)
        return discounted_price, offers[applied_offer]
      when 2
        discounted_price = (base_price.to_f - 250.to_f).round(2)
        return discounted_price, offers[applied_offer]
      else
        nil
      end
    end
end
