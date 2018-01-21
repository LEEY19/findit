class AddMatchTypeToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :match_type, :string
  end
end
