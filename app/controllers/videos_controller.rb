class VideosController < ApplicationController
  def index
    rand_no = rand(1..Video.all.count)
    @video = Video.find(rand_no)
    @products = @video.products
    @all_other_video = Video.where.not(id: [@video.id])
  end

  def show
    @video = Video.find(params[:id])
    @products = @video.products
    @all_other_video = Video.where.not(id: [params[:id]])
  end
end
