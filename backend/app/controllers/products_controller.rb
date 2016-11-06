class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end
  
  # GET /products/upload
  # for batch upload products through json.
  def upload
    data = params[:json_data]
		products = JSON.parse(data)
		products.each do |product|
			@product = Product.find_by_id(product['id'])
			if @product.nil?
			  if params.include?(:image_id)
			    @product = Product.create(:id => product['id'], :name => product['name'], :upc_code => product['upc_code'], :product_code => product['product_code'], :sell_by_date => product['sell_by_date'], :image_id => product['image_id'])
			  else
			    @image = Image.find_by_filename(product['image_filename'])
			    if @image.nil?
			      @image = Image.create(:description => product['name'], :filename => product['image_filename'], :category => 3)
			    end
			    	@product = Product.create(:id => product['id'], :name => product['name'], :upc_code => product['upc_code'], :product_code => product['product_code'], :sell_by_date => product['sell_by_date'], :image_id => @image.id)
			  end
			end
		end
		
    respond_to do |format|
      format.html { redirect_to :controller => 'products', :action => 'index' }
    end
    
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :upc_code, :product_code, :sell_by_date, :image_id)
    end
end
