class ProductsController < ApplicationController

  before_action :authenticate_admin! , :only => [:edit, :update, :destroy]
	before_action :set_product, only: [:show, :edit, :update, :destroy]

	def index
    @products = Product.all.paginate(:page => params[:page], :per_page => 50)
  end

	def import
	  Product.import(params[:file])
	  redirect_to root_url, notice: "Products imported."
	end

	def edit
	end

	def show
		@product = Product.find(params[:id])
	end

	def new
	end

	def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render action: 'show', status: :created, location: @product }
      else
        format.html { render action: 'new' }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
    end
  end

  def edit_multiple
    @products = Product.find(params[:product_ids])
    if @products.map{|x| x.delete}
      redirect_to root_url, notice: 'Products was successfully deleted.'
    end
  end

	private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:title,:titlelink,:price,:room,:roomlink,:area,:arealink,
      																:person,:personlink,:date)
    end

end
