class AddBanStatusToMicropost < ActiveRecord::Migration
  def change
    add_column :microposts, :ban_status, :boolean
    change_column_default :microposts, :ban_status, false
  end
end
