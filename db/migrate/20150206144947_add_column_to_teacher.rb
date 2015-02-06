class AddColumnToTeacher < ActiveRecord::Migration
  def change
    add_column :teachers, :user_type, :integer
    add_column :students, :user_type, :integer
    add_column :parents, :user_type, :integer
  end
end
