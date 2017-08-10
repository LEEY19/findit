class AddContentCategoryToVideos < ActiveRecord::Migration[5.0]
  def change
    add_column :videos, :content_category, :string
  end
end
