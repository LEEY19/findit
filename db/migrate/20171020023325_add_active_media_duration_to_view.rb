class AddActiveMediaDurationToView < ActiveRecord::Migration[5.0]
  def change
    add_column :views, :active_media_duration, :float, default: 0
  end
end
