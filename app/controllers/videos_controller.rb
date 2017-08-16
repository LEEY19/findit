class VideosController < ApplicationController
  def index
    rand_no = rand(1..Video.all.count)
    @video = Video.find(rand_no)
    @products = @video.products
    @view = View.create(video_id: @video.id)
    @all_other_video = Video.where.not(id: [@video.id]).shuffle
  end

  def show
    @video = Video.find(params[:id])
    @products = @video.products
    @view = View.create(video_id: @video.id)
    @all_other_video = Video.where.not(id: [params[:id]]).shuffle
  end

  def click_product
    if params[:view_id]
      Click.create(view_id: params[:view_id], product_id: params[:product_id])
    end
    @product = Product.find(params[:product_id])
    redirect_to @product.product_link
  end

  def track_scroll
    if params[:view_id] && params[:view_id] != ""
      @view = View.find(params[:view_id])
      @view.update(scrolled: true)
    end
    render json: "Success"
  end

  def track_toast_click
    if params[:view_id] && params[:view_id] != ""
      @view = View.find(params[:view_id])
      @view.update(more_info: true)
    end
    render json: "Success"
    # redirect_to @url
  end

  def show_manual
    @video = Video.find(params[:id])
    @products = @video.products
    @all_other_video = Video.where.not(id: [params[:id]]).shuffle
  end
end
