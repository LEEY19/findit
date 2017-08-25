class AddAppearedAtToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :appeared_at, :string, :default => "0:00"
  end
end
