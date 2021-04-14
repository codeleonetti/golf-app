
Golfer.destroy_all
GolfCourse.destroy_all



number_of_holes = [9,18]

#handicap = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32]
handicap_min = 0.0
handicap_max = 32.0

# hole_18 = [71,72]
# hole_9 = [34,35,36]
#  par = [70..72]
#  front_9 = [34..36]
#  back_9 = [34..36]

 #if front_9 ==
#if front 9 && back 9 is played 
#then front_9 + back_9 = par
#else front_9



10.times do

    Golfer.create(
      name: Faker::Name.name,
      hometown: Faker::Address.city,
      username:Faker::Name.last_name,
      password: "password",
      handicap: rand(handicap_min..handicap_max)
    )
end


10.times do

    GolfCourse.create(
        name: Faker::Company.name,
        location: Faker::Address.street_address + Faker::Address.city + Faker::Address.state_abbr,
        phone_number: Faker::PhoneNumber.phone_number,
        number_of_holes: 18, 
        scorecard: 72,
        front_9: 36,
        back_9: 36,
        golfer: Golfer.all.sample
    )



end

puts "you did it you stud you"

