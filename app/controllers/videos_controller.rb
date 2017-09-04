class VideosController < ApplicationController
  def index
    rand_no = rand(1..Video.all.count)
    @video = Video.find(rand_no)
    @products = @video.products
    @view = View.create(video_id: @video.id)
    @all_other_video = Video.where.not(id: [@video.id]).shuffle
    @product_categories = @products.pluck(:product_category).uniq
  end

  def show
    @video = Video.find(params[:id])
    @products = @video.products
    @view = View.create(video_id: @video.id)
    @all_other_video = Video.where.not(id: [params[:id]]).shuffle
    @product_categories = @products.pluck(:product_category).uniq
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
    @product_categories = @products.pluck(:product_category).uniq
  end

  def analytics
    @id = params[:id]
    if @id == "0"
      @total_views = View.all
      @scrolled_views = View.where(scrolled: true).pluck(:id)
      @more_info_views = View.where(more_info: true).pluck(:id)
      @overall_views_clicks = Click.all.pluck(:view_id)
      @scroll_or_clicks = @scrolled_views | @more_info_views | @overall_views_clicks
      @scrolled_and_more_info = @scrolled_views & @more_info_views
      @scrolled_and_clicks = @scrolled_views & @overall_views_clicks
      @more_info_and_clicks = @more_info_views & @overall_views_clicks
      @all = @scrolled_and_clicks & @more_info_views
    else
      @total_views = View.where(video_id: @id)
      @scrolled_views = View.where(scrolled: true, video_id: @id).pluck(:id)
      @more_info_views = View.where(more_info: true, video_id: @id).pluck(:id)
      @overall_views_clicks = Click.joins(view: :video).where(videos: {id: @id}).pluck(:view_id)
      @scroll_or_clicks = @scrolled_views | @more_info_views | @overall_views_clicks
      @scrolled_and_more_info = @scrolled_views & @more_info_views
      @scrolled_and_clicks = @scrolled_views & @overall_views_clicks
      @more_info_and_clicks = @more_info_views & @overall_views_clicks
      @all = @scrolled_and_clicks & @more_info_views
    end
  end

  def dynamic_show
    @selected_products = Video.find(params[:video_id]).products.where(product_category: params[:product_category])
    @view_id = params[:view_id]
    respond_to do |format|
      @selected_products
      @view_id
      format.js
    end
  end

  def register_category_click
    @view = View.find(params[:view_id])
    array = @view.category_clicks
    # new_cat = /All Products/.match(params[:category]) ? "All" : params[:category]
    array = array << params[:category]
    array = array.uniq
    @view.update(category_clicks: array)
    render json: "Success"
  end
end
