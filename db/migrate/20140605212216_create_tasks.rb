class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.boolean :completed, default: false
      t.datetime :due_date
      t.integer :user_id

      t.timestamps
    end
  end
end
