
class GolfCoursesController < ApplicationController

    get '/golf_courses/index' do # grabs all courses from db #Read
        if logged_in?
            @course = GolfCourse.all
            erb :"golf_courses/index"
        else
            redirect "/"
        end
    end

    get '/golf_courses/:id/home' do
        if logged_in? && @course = GolfCourse.find_by_id(params[:id])
            erb :"golf_courses/home"
        else 
            redirect "golf_courses/index"
        end
    end


    get '/golf_courses/new' do 
        if logged_in?
            erb :"golf_courses/new"
        else
            redirect "golf_courses/index"
        end
    end

    post '/golf_courses/new' do 
        
        @course = GolfCourse.new(params)
        @course.golfer_id = logged_in?
        if @course.save
            flash[:notice] = "new course added!"
            redirect "golf_courses/#{@course.id}/home"
        else
            flash[:notice] = "course failed to be saved"
            redirect "golf_courses/index"
        end    
    end
    
 
    get '/golf_courses/:id' do
       
         if @course = GolfCourse.find_by_id(params[:id])
            erb :"golf_courses/show"
         else 
            flash[:notice] = "That course doesn't exist"
            redirect "golf_courses/index"
        end
    end
    

    get '/golf_courses/:id/edit' do # 
         @course = GolfCourse.find_by_id(params[:id])   
        if @course.golfer_id != logged_in? || @course.golfer_id == nil
            flash[:notice] = "Not authorized to edit this course"
            redirect "golf_courses/index"
        else
            erb :"golf_courses/edit"
        end
    end
    post '/golf_courses/:id/edit' do
        @course = GolfCourse.find_by_id(params[:id])
        @course.update(params)
        if @course.save
            redirect "golf_courses/#{@course.id}/home" #
            flash[:notice] = "Course has been updated"
        else  
            redirect "golf_courses/home"
       end    
    end
   

    post '/golf_courses/:id' do  #Delete
        @course = GolfCourse.find_by_id(params[:id])
        if @course.golfer_id == logged_in?
            @course.destroy
            flash[:notice] = "course has been deleted"
            redirect "golf_courses/index"
        else
            flash[:notice] = "You are not authorized to delete this course"
            redirect "golf_courses/index"
        end
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
