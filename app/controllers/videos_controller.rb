class VideosController < ApplicationController
  def index
    rand_no = rand(1..Video.all.count)
    @video = Video.find(rand_no)
    @products = @video.products
    @view = View.create(video_id: @video.id)
    @all_other_video = Video.where.not(id: [@video.id])
  end

  def show
    @video = Video.find(params[:id])
    @products = @video.products
    @view = View.create(video_id: @video.id)
    @all_other_video = Video.where.not(id: [params[:id]])
  end

  def click_product
    Click.create(view_id: params[:view_id], product_id: params[:product_id])
    @product = Product.find(params[:product_id])
    redirect_to @product.product_link
  end

  def track_scroll
    @view = View.find(params[:view_id])
    @view.update(scrolled: true)
    render json: "Success"
  end
end
