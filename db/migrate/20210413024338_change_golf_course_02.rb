class ChangeGolfCourse02 < ActiveRecord::Migration[5.2]
  def change
    add_column :golf_courses, :front_9, :integer
    add_column :golf_courses, :back_9, :integer
  end
end
