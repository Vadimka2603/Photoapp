class AddCounterCacheToMicroposts < ActiveRecord::Migration
  def self.up
    add_column :microposts, :likes_count, :integer, :default => 0
    add_column :microposts, :comments_count, :integer, :default => 0

    Micropost.find_each do |micropost|
      micropost.update_attribute(:likes_count, micropost.likes.length)
      micropost.update_attribute(:comments_count, micropost.comments.length)
    end
  end

  def self.down
    remove_column :users, :microposts_count
    remove_column :users, :likes_count
    remove_column :users, :comments_count
    remove_column :microposts, :likes_count
    remove_column :microposts, :comments_count
  end
end