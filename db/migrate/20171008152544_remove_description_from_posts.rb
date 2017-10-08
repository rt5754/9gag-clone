class RemoveDescriptionFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :description
  end
end
