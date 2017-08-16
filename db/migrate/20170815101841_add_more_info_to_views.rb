class AddMoreInfoToViews < ActiveRecord::Migration[5.0]
  def change
    add_column :views, :more_info, :boolean, :default => false
  end
end
