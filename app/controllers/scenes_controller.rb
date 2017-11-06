class ScenesController < ApplicationController
  def index
    @scenes = Scene.all
  end

  def show
    @scene = Scene.find(params[:id])
    @products = @scene.scene_products
  end
end
