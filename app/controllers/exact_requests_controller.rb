class ExactRequestsController < ApplicationController
  def create
    @exact_request = ExactRequest.new(exact_request_params.merge(view_id: session[:user]))

    if @exact_request.save
      @message = "Request created successfully"
    else
      @product = Product.find(exact_request_params[:product_id])
      
      render "products/exact_match"
    end
  end

  private

  def exact_request_params
    params.require(:exact_request).permit(:email, :product_id)
  end
end
