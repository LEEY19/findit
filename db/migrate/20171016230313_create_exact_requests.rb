class CreateExactRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :exact_requests do |t|
      t.string :email
      t.belongs_to :view, foreign_key: true
      t.belongs_to :product, foreign_key: true

      t.timestamps
    end
  end
end
