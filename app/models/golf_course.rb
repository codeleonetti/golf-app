class GolfCourse < ActiveRecord::Base

    belongs_to :golfer

   
    validates :name, uniqueness: true
    validates :name, :location, :phone_number, :number_of_holes, :scorecard, :front_9, :back_9, presence: true

   
end


