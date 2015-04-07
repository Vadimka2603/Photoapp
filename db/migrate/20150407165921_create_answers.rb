class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.references :comment, index: true
      t.timestamps null: false
    end
  end
end