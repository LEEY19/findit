class AddProductCategoryToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :product_category, :string, :default => nil
  end
end
