class AddScrolledToViews < ActiveRecord::Migration[5.0]
  def change
    add_column :views, :scrolled, :boolean, :default => false
  end
end
