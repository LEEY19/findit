class AddViewTypeToViews < ActiveRecord::Migration[5.0]
  def change
    add_column :views, :view_type, :string
  end
end
