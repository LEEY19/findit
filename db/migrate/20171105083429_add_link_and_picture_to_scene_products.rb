class AddLinkAndPictureToSceneProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :scene_products, :product_link, :string
    add_column :scene_products, :picture_url, :string
  end
end
