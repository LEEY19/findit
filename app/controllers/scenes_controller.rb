class ScenesController < ApplicationController
  def index
    @scenes = Scene.all
    @products = []
    if (params[:filter])
      case params[:type]
        when "products"
          @products = SceneProduct.joins(scene: :episode).where(episodes: {id: params[:episode]})
        when "scenes"
          @scenes = Scene.where(episode_id: params[:episode])
        when "characters"
          @products = SceneProduct.where(seen_on: params[:character])
        else
          puts "Nothing"
      end
    end
  end

  def show
    @scene = Scene.find(params[:id])
    @products = @scene.scene_products
  end
end
