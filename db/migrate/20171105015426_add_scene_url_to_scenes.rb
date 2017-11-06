class AddSceneUrlToScenes < ActiveRecord::Migration[5.0]
  def change
    add_column :scenes, :scene_url, :string
  end
end
