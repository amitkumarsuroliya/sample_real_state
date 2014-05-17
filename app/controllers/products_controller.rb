class ProductsController < ApplicationController

	def index
    @products = Product.all
  end

	def import
	  Product.import(params[:file])
	  redirect_to root_url, notice: "Products imported."
	end

	def edit
	end

	def delete
		@product.destroy
		redirect_to products_url
	end

end
