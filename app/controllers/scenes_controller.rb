class ScenesController < ApplicationController
  def index
    if !session[:linear_landing]
      session[:linear_landing] = SecureRandom.uuid
      gon.event_tracker = {category: "Session", action: "Landed", label: ""}
    end
    @scenes = Scene.where(episode_id: 2)
    @products = []
    if (params[:filter])
      case params[:type]
        when "products"
          @products = SceneProduct.joins(scene: :episode).where(episodes: {id: params[:episode]})
          @products = @products.to_a.uniq {|x| [x.title]}
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
    @products = @products.sort_by &:product_annot
  end

  def t_and_c
  end
end
