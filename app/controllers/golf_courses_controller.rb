
class GolfCoursesController < ApplicationController

    get '/golf_courses/index' do # grabs all courses from db #Read
        @course = GolfCourse.all
        erb :"golf_courses/index"
    end
    get '/golf_courses/:id/home' do
        @course = GolfCourse.find_by_id(params[:id])
        erb :"golf_courses/home"
    end


    get '/golf_courses/new' do # this gets the form to create a new course
        erb :"golf_courses/new"
    end
    post '/golf_courses/new' do #saves new istance of a course #Create
        @course = GolfCourse.new(params)
             #using params to save all data into their own (ie :name,:address, etc)
       if @course.save #saves the instance of course
        flash[:notice] = "new course added!"
        redirect "golf_courses/#{@course.id}/home"
       else
        flash[:notice] = "course failed to be saved"
        redirect "golf_courses/index"
       end    
    end
    get '/golf_courses/:id' do
        erb :"golf_courses/show"
    end

    

    get '/golf_courses/:id/edit' do # this getting the info to update  
        @course = GolfCourse.find_by_id(params[:id])   #using a instance variable to find_by_id we just set
        erb :"golf_courses/edit"
    end
    post '/golf_courses/:id/edit' do
        @course = GolfCourse.find_by_id(params[:id]) #using params to find course by its id
        @course.update(params)
        if @course.save
            redirect "golf_courses/#{@course.id}/home"
            flash[:notice] = "Course has been updated"
        else  
            redirect "golf_courses/home"
       end    
    end
    get '/golf_courses/:id/edit' do
        erb :"golf_courses/show"
    end

    delete '/golf_courses/:id' do  #Delete
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