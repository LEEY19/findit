class AddColorsAndSizesToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :colors, :string
    add_column :products, :sizes, :string
    add_column :products, :screenshot, :string
  end
end
