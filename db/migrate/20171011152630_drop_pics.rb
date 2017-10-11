class DropPics < ActiveRecord::Migration
  def change
    drop_table :pics
  end
end
