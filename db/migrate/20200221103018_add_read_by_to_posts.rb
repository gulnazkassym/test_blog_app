class AddReadByToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :read_by, :text, array: true, default: []
  end
end
