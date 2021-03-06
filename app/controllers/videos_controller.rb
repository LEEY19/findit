class VideosController < ApplicationController
  before_action :set_categories, only: [:index, :show]

  def index
    @videos = if params[:category]
      Video.where(content_category: params[:category])
    else
      Video.all
    end

    @videos = @videos.page(params[:page]).per(12)
  end

  def show
    @video = Video.find(params[:id])
    @productss = @video.products.order(:id)

    if params[:id] == "1"
      @products = @productss.reject {|x| (x.match_type == 'Similar' && @productss[x.id - 2].match_type == 'Exact') }
    else
      @products = @productss
    end

    if !session[:user]
      @view = View.create(video_id: @video.id, view_type: "wc")
      session[:user] = @view.id
      session[:time] = DateTime.now
    else
      @view = View.find(session[:user])
    end
    @all_other_video = Video.where.not(id: [params[:id]]).shuffle
    @product_categories = @products.pluck(:product_category).uniq
    if params[:j]
      current_count = @view.jumps
      @view.update(jumps: current_count + 1)
    end
  end

  def click_product
    if params[:view_id]
      Click.create(view_id: params[:view_id], product_id: params[:product_id])
    end
    @product = Product.find(params[:product_id])
    render json: "Success"
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

  def woc
    @video = Video.find(params[:id])
    # @products = @video.products
    if !session[:user]
      @view = View.create(video_id: @video.id, view_type: "woc")
      session[:user] = @view.id
      session[:time] = DateTime.now
    else
      @view = View.find(session[:user])
    end
    @all_other_video = Video.where.not(id: [params[:id]]).shuffle
    # @product_categories = @products.pluck(:product_category).uniq
    if params[:j]
      current_count = @view.jumps
      @view.update(jumps: current_count + 1)
    end
  end

  def analytics
    @id = params[:id]
    if @id == "0"
      @total_views = View.all
      @scrolled_views = View.where(scrolled: true).pluck(:id)
      @more_info_views = View.where(more_info: true).pluck(:id)
      @counter_array = []
      @total_views.each do |x|
        if x.category_clicks != []
          @counter_array << x.id
        end
      end
      @overall_views_clicks = Click.all.pluck(:view_id)
      @original_total = @scrolled_views | @more_info_views | @overall_views_clicks
      @current_total = @scrolled_views | @more_info_views | @overall_views_clicks | @counter_array
      @scrolled_and_more_info = @scrolled_views & @more_info_views
      @scrolled_and_clicks = @scrolled_views & @overall_views_clicks
      @more_info_and_clicks = @more_info_views & @overall_views_clicks
      @scrolled_and_cat_clicks = @scrolled_views & @counter_array
      @all = @overall_views_clicks & @scrolled_views & @more_info_views & counter_array
    else
      @total_views = View.where(video_id: @id)
      @scrolled_views = View.where(scrolled: true, video_id: @id).pluck(:id)
      @more_info_views = View.where(more_info: true, video_id: @id).pluck(:id)
      @counter_array = []
      @total_views.each do |x|
        if x.category_clicks != []
          @counter_array << x.id
        end
      end
      @overall_views_clicks = Click.joins(view: :video).where(videos: {id: @id}).pluck(:view_id)
      @original_total = @scrolled_views | @more_info_views | @overall_views_clicks
      @current_total = @scrolled_views | @more_info_views | @overall_views_clicks | @counter_array
      @scrolled_and_more_info = @scrolled_views & @more_info_views
      @scrolled_and_clicks = @scrolled_views & @overall_views_clicks
      @more_info_and_clicks = @more_info_views & @overall_views_clicks
      @scrolled_and_cat_clicks = @scrolled_views & @counter_array
      @all = @overall_views_clicks & @scrolled_views & @more_info_views & @counter_array
    end
  end

  def dynamic_show
    # @selected_products = Video.find(params[:video_id]).products.where(product_category: params[:product_category])
    @selected_products = Product.where(product_category: params[:product_category])
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

  def record_session_duration
    @view = View.find(session[:user])
    @curr_sess_duration = @view.session_duration
    @sess_duration = ((DateTime.now - session[:time].to_datetime)*24*60*60).to_i + @curr_sess_duration
    @view.update(session_duration: @sess_duration)
    render json: "Success"
  end

  def update_session_time
    @view = View.find(session[:user])
    session[:time] = DateTime.now
    render json: "Success"
  end

  def active_media_duration
    @view = View.find(session[:user])
    @view.active_media_duration += params[:time].to_i
    @view.save

    head :ok
  end

  # def active_media_duration
  #   @view = View.find(session[:user])
  #   @curr_sess_duration = @view.active_media_duration
  #   @sess_duration = ((DateTime.now - session[:time].to_datetime)*24*60*60).to_i + @curr_sess_duration
  #   @view.update(active_media_duration: @sess_duration)

  #   head :ok
  # end

  def rv
    @video = Video.find(params[:id])
    # @products = @video.products
    if !session[:user]
      @view = View.create(video_id: @video.id, view_type: "rv")
      session[:user] = @view.id
      session[:time] = DateTime.now
    else
      @view = View.find(session[:user])
    end
    @all_other_video = Video.where.not(id: [params[:id]]).shuffle
    # @product_categories = @products.pluck(:product_category).uniq
    @related_videos = nil
    if params[:id] == '16' || params[:id] == '17'
      if params[:rv_id]
        @video = RelatedVideo.find(params[:rv_id])
        @related_videos = RelatedVideo.where(video_id: params[:id]).shuffle
      else
        @related_videos = RelatedVideo.where(video_id: params[:id])
      end
    else
      @related_videos = Video.where.not(id: [params[:id]]).shuffle
    end

    if params[:j]
      current_count = @view.jumps
      @view.update(jumps: current_count + 1)
    end
  end

  private

  def set_categories
    @categories = Video.all.pluck(:content_category).uniq
  end
end
