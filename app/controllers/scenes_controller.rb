class ScenesController < ApplicationController
  def index
    if !session[:linear_landing]
      session[:linear_landing] = SecureRandom.uuid
      gon.event_tracker = {category: "Session", action: "Landed", label: ""}
    end
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
    if params[:type] == 'products'
      gon.event_tracker = {category: "MenuClick", action: "Click", label: "Product"}
    else 
      gon.event_tracker = {category: "MenuClick", action: "Click", label: "Scene"}
    end
    @products = @scene.scene_products
  end

  def t_and_c
  end
end
