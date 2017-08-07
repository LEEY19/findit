class CreateViews < ActiveRecord::Migration[5.0]
  def change
    create_table :views do |t|
      t.references :video, foreign_key: true

      t.timestamps
    end
  end
end
