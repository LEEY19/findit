class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.references :video, foreign_key: true
      t.string :title
      t.string :product_link
      t.float :price
      t.string :picture

      t.timestamps
    end
  end
end
