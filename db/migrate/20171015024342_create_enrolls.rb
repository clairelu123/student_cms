class CreateEnrolls < ActiveRecord::Migration
  def change
    create_table :enrolls do |t|
      t.references :student
      t.references :course
      t.float :grade
      t.string :letter
      t.timestamps null: false
    end
    add_index :enrolls, ["student_id", "course_id"]
  end
end
