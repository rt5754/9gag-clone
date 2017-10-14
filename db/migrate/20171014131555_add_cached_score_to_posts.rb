class AddCachedScoreToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :cached_weighted_score, :integer, :default => 0
  end
end
