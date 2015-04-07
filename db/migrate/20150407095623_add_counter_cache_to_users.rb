class AddCounterCacheToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :microposts_count, :integer, :default => 0
    add_column :users, :likes_count, :integer, :default => 0
    add_column :users, :comments_count, :integer, :default => 0

    User.find_each do |user|
      user.update_attribute(:microposts_count, user.microposts.length)
      user.update_attribute(:microposts_count, user.likes.length)
      user.update_attribute(:microposts_count, user.comments.length)
end
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