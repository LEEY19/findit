class AddCategoryClicksToViews < ActiveRecord::Migration[5.0]
  def change
    add_column :views, :category_clicks, :text, array: true, default: []
  end
end
