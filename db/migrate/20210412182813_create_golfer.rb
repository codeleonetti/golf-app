class CreateGolfer < ActiveRecord::Migration[5.2]
  def change
    create_table :golfer do |t|
      t.string :name
      t.string :hometown
      t.string :username
      t.string :password_digest
      t.float :handicap
    end
  end
end
