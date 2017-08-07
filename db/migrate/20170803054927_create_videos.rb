class CreateVideos < ActiveRecord::Migration[5.0]
  def change
    create_table :videos do |t|
      t.string :video_link
      t.string :title
      t.string :picture

      t.timestamps
    end
  end
end
