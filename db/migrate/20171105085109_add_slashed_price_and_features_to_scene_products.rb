class AddSlashedPriceAndFeaturesToSceneProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :scene_products, :slashed_price, :string
    add_column :scene_products, :features, :string
  end
end
