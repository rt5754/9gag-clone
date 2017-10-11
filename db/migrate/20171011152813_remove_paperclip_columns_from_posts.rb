class RemovePaperclipColumnsFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :image_file_name 
    remove_column :posts, :image_content_type 
    remove_column :posts, :image_file_size 
    remove_column :posts, :image_updated_at
    add_column :posts, :image, :string
  end
end
