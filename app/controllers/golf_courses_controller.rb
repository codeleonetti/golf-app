
class GolfCoursesController < ApplicationController

    get '/golf_courses' do
        @course = GolfCourse.all
        erb :"golf_courses/golf_course"
    end

    get '/golf_courses/new' do # this sets a new page
        erb :"golf_course/new"
    end

    get '/golf_courses/:id' do
       
        id = params[:id]     #setting a variable
        @course = GolfCourse.find_by_id(params[id])   #using a instance variable to find_by_id we just set
        erb :"golf_course/show"
    end

    post '/golf_courses' do #saves new istance of a course
        course = Course.new(params)     #using params to save all data into their own (ie :name,:address, etc)
        course.save
    end

    get '/golf_courses/:id/edit' do
        # find by id with params 
        #@course = GolfCourse.find_by(id:)

        #edit that form
        
    end

    post '/golf_courses' do

    end

    delete '/golf_courses/:id' do
        GolfCourse.destroy_all
    end

    put '/golf_courses/:id' do

    end



end


# | HTTP VERB |   Route         |  Action |
#| GET       | /golf_courses          | index   |
#| GET       | /golf_courses/:id      | show    | 
#| GET       | /golf_courses/new      | new     | 
#| GET       | /golf_courses/:id/edit | edit    | 
#| POST      | /golf_courses          | create  | 
#| DELETE    | /golf_courses/:id      | destroy |
#| PUT/PATCH | /golf_courses/:id      | edit    |