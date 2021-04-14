class GolfersController < ApplicationController

    get '/golfer' do
        @golfer = Golfer.all
        erb :"golfer/index"
    end
    
    get '/golfer/new' do
        erb :"golfer/new"
     end

    post '/golfer/new' do
       @golfer = Golfer.new(params)
       if @golfer && @golfer.save
        session[:golfer_id] = @golfer.id
        redirect"/golfer/show"
       else
        redirect "/login"
       end
    end
    
     get '/golfer/show' do
        id = params[:id]
        @golfer = Golfer.find_by_id(params[id])
        erb :"golfer/show"
    end
    # create profile page 
    post '/golfer' do
        @golfer = Golfer.new(params)
        @golfer.save
       erb :"golfer/show"
    end

    get '/golfer/:id/edit' do

    end


    delete '/golfer/:id' do
        Golfer.destroy_all
    end

    put '/golfer/:id' do

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
