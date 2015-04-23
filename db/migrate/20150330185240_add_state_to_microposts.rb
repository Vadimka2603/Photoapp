class AddStateToMicroposts < ActiveRecord::Migration
  def self.up
    add_column :microposts, :aasm_state, :string
  end

  def self.down
    remove_column :microposts, :aasm_state
  end
end