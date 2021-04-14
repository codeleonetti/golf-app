class Golfer < ActiveRecord::Base

    has_many :golf_courses
    has_secure_password
end