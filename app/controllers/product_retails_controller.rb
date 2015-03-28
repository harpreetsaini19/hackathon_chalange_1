class ProductRetailsController < ApplicationController
  before_action :set_product_retail, only: [:show, :edit, :update, :destroy]
  EMPTY_SEARCH = "Search box is empty."

  def index
    @product_retails = ProductRetail.all
  end

  def show
  end

  def new
    @product_retail = ProductRetail.new
  end

  def edit
  end

  def create
    @product_retail = ProductRetail.new(product_retail_params)

    respond_to do |format|
      if @product_retail.save
        format.html { redirect_to @product_retail, notice: 'Product retail was successfully created.' }
        format.json { render action: 'show', status: :created, location: @product_retail }
      else
        format.html { render action: 'new' }
        format.json { render json: @product_retail.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @product_retail.update(product_retail_params)
        format.html { redirect_to @product_retail, notice: 'Product retail was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @product_retail.errors, status: :unprocessable_entity }
      end
    end
  end

  def search
    if params[:search].blank?
      @results = []
    else
      @results = ProductRetail.joins("LEFT JOIN product_retail_offers on product_retails.id = product_retail_offers.product_retail_id").select("product_retails.* ,product_retail_offers.offer,product_retail_offers.discounted_price").where("product_retails.product_name like ?",'%'+params[:search].to_s+'%').order("product_retail_offers.discounted_price")
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_retail
      @product_retail = ProductRetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_retail_params
      params.require(:product_retail).permit(:product_name, :retail_name, :base_price)
    end
end
