class CreateSceneProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :scene_products do |t|
      t.references :scene, foreign_key: true
      t.string :seen_on
      t.string :price
      t.string :title
      t.string :free_gift
      t.string :sizes
      t.string :colors
      t.string :discount_code
      t.string :discount_message

      t.timestamps
    end
  end
end
