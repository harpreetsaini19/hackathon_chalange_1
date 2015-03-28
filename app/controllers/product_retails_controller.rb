class ProductRetailsController < ApplicationController
  before_action :set_product_retail, only: [:show, :edit, :update, :destroy]
  EMPTY_SEARCH = "Search box is empty."

  # GET /product_retails
  # GET /product_retails.json
  def index
    @product_retails = ProductRetail.all
  end

  # GET /product_retails/1
  # GET /product_retails/1.json
  def show
  end

  # GET /product_retails/new
  def new
    @product_retail = ProductRetail.new
  end

  # GET /product_retails/1/edit
  def edit
  end

  # POST /product_retails
  # POST /product_retails.json
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

  # PATCH/PUT /product_retails/1
  # PATCH/PUT /product_retails/1.json
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
      redirect_to search_path, alert: EMPTY_SEARCH
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
