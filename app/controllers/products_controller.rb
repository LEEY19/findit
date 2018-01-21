class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :exact_match]

  def show; end

  def exact_match
    @exact_request = ExactRequest.new
  end

  def toggle_product
    @match_type = params[:match_type]
    if @match_type == 'similar'    
      @product = Product.find(params[:id].to_i + 1)
      @url = "/products/" + @product.id.to_s + "/toggle_product?match_type=exact&product_id=" + @product.id.to_s
      @btn_text = "View exact match"
      @product_link = @product.product_link
    else
      @product = Product.find(params[:id].to_i - 1)
      @url = "/products/" + @product.id.to_s + "/toggle_product?match_type=similar&product_id=" + @product.id.to_s
      @btn_text = "View similar match"
      @product_link = @product.product_link
    end
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end
end
