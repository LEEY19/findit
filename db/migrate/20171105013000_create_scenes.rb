class CreateScenes < ActiveRecord::Migration[5.0]
  def change
    create_table :scenes do |t|
      t.references :episode, foreign_key: true
      t.string :description

      t.timestamps
    end
  end
end
