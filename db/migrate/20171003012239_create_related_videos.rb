class CreateRelatedVideos < ActiveRecord::Migration[5.0]
  def change
    create_table :related_videos do |t|
      t.references :video, foreign_key: true
      t.string :title
      t.string :video_link
      t.string :picture
      t.string :duration

      t.timestamps
    end
  end
end
