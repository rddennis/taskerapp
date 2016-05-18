class CreateUserTasks < ActiveRecord::Migration
  def change
    create_table :user_tasks do |t|
      t.string :description
      t.date :due_date

      t.timestamps null: false
    end
  end
end
