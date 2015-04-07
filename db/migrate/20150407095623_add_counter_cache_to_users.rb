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
  end

  def self.down
    remove_column :users, :microposts_count
    remove_column :users, :likes_count
    remove_column :users, :comments_count
  end
end