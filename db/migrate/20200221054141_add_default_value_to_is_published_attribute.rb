class AddDefaultValueToIsPublishedAttribute < ActiveRecord::Migration[5.2]
  def up
    change_column :posts, :is_published, :boolean, default: false
  end

  def down
    change_column :posts, :is_published, :boolean, default: nil
  end
end
