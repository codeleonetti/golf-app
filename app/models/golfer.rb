class Golfer < ActiveRecord::Base

    has_many :golf_courses
    has_secure_password

    validates :username, :name, presence: true
    #this is checking that there is a password with the Bcrypt gem cant leave password empty
    validates :username, uniqueness: true
end