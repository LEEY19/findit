class AddProductAnnoToSceneProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :scene_products, :product_annot, :string
  end
end
