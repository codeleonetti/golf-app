class GolfersController < ApplicationController

    get '/golfer' do
        @golfer = Golfer.all
       erb :"golfer/index"
    end
    

    get '/golfer/:id' do
       # if Golfer.where(id: params[:id]).exists?
        if @golfer = Golfer.find_by_id(params[:id])
        erb :"golfer/show"
        else 
            flash[:alert] = "Please log in on the home page"
            redirect "/"
        end
    end
    
    
    get '/golfer/:id/edit' do
        if logged_in?
             @golfer = Golfer.find_by_id(params[:id])
            # if @golfer.id != logged_in? || @golfer.id == nil
            if current_user.id == @golfer.id  
                erb :"golfer/edit"
            else
                flash[:alert] = "Please log in on the home page."
                redirect "/" 
             end
        else
            redirect '/login'
        end
    end
    post '/golfer/:id/edit' do
            @golfer = Golfer.find_by_id(params[:id])
            @golfer.update(params)
            if @golfer.save
                redirect "golfer/#{@golfer.id}"
            else
                redirect "golfer/new"
            end   
    end


    post '/golfer/:id' do
        @golfer = Golfer.find_by_id(params[:id])
        @golfer.destroy
        redirect "/"
    end 
end

# | HTTP VERB |   Route         |  Action |
#| GET       | /golfer          | index   |
#| GET       | /golfer/:id      | show    | 
#| GET       | /golfer/new      | new     | 
#| GET       | /golfer/:id/edit | edit    | 
#| POST      | /golfer          | create  | 
#| DELETE    | /golfer/:id      | destroy |
#| PUT/PATCH | /golfer/:id      | edit    |

#setting up golfers
    #<h3><a href="/golfer/<%=@golfer.id%>">Profile Page</a></h3>

