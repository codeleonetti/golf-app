
class GolfCoursesController < ApplicationController

    get '/golf_courses/index' do # grabs all courses from db
        @course = GolfCourse.all
        erb :"golf_courses/index"
    end

    get '/golf_courses/new' do # this gets the form to create a new course
        erb :"golf_courses/new"
    end

    post '/golf_courses/new' do #saves new istance of a course
       
        @course = GolfCourse.new(params)
             #using params to save all data into their own (ie :name,:address, etc)
       if @course.save #saves the instance of course
        flash[:notice] = "new course added!"
        redirect "golf_courses/index"
       else
        flash[:notice] = "course failed to be saved"
        redirect "golf_courses/new"
       end    
    end

    get '/golf_courses' do # this getting the info to update
       
        id = params[:id]     #setting a variable
        @course = GolfCourse.find_by_id(params[id])   #using a instance variable to find_by_id we just set
        erb :"golf_courses/show"
    end

    post '/golf_courses/new' do #saves new istance of a course
        @course = GolfCourse.new(params)     #using params to save all data into their own (ie :name,:address, etc)
       if @course.save #saves the instance of course
        flash[:notice] = "new course added!"
        redirect "golf_courses/index"
       else
        flash[:notice] = "course failed to be saved"
        redirect "golf_courses/new"
       end    
    end


    delete '/golf_courses/:id' do
        GolfCourse.destroy_all
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