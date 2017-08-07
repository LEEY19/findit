class CreateClicks < ActiveRecord::Migration[5.0]
  def change
    create_table :clicks do |t|
      t.references :view, foreign_key: true
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
