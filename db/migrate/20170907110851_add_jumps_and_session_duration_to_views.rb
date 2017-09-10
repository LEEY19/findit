class AddJumpsAndSessionDurationToViews < ActiveRecord::Migration[5.0]
  def change
    add_column :views, :jumps, :integer, :default => 0
    add_column :views, :session_duration, :float, :default => 0.00
  end
end
