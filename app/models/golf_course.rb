class GolfCourse < ActiveRecord::Base

    belongs_to :golfer

   
    validates :name, uniqueness: true
    validates :name, presence: true

   
end


