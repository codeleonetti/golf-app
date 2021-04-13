class ChangeGolfCourse01 < ActiveRecord::Migration[5.2]
  def change
    rename_column :golf_courses, :par_for_course, :scorecard

  end
end
