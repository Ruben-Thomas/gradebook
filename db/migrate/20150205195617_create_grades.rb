class CreateGrades < ActiveRecord::Migration
  def change
    create_table :grades do |t|
      t.string :grade
      t.string :date
      t.integer :student_id

      t.timestamps null: false
    end
  end
end
