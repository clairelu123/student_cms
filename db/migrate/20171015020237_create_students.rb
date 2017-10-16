class CreateStudents < ActiveRecord::Migration
  def up
    create_table :students do |t|

      t.string "name", :limit => 50
      t.integer "snum"
      t.string "email", :default => "", :null => false
      t.timestamps null: false
    end
  end

  def down
    drop_table :students
  end
end
