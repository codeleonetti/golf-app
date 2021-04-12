class CreateGolfCourse < ActiveRecord::Migration[5.2]
  def change
    create_table :golf_courses do |t|
      t.string :name
      t.string :location
      t.string :phone_number
      t.string :number_of_holes
      t.integer :par_for_course
    end
  end
end
