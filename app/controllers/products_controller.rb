class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :exact_match]

  def show; end

  def exact_match; end

  private

  def set_product
    @product = Product.find(params[:id])
  end
end
