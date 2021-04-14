class AddGolferIdToGolfer < ActiveRecord::Migration[5.2]
  def change
    add_column :golf_courses, :golfer_id, :integer
    
  end
end
