class AddInstagramToMicroposts < ActiveRecord::Migration
  def change
    add_column :microposts, :instagram_id, :integer
    add_column :microposts, :instagram_user_name, :string
  end
end
