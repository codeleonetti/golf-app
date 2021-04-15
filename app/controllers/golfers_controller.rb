class GolfersController < ApplicationController

    get '/golfer' do
        @golfer = Golfer.all
       erb :"golfer/index"
    end
    

    get '/golfer/:id' do
       
        @golfer = Golfer.find(params[:id])
       
       
        erb :"golfer/show"
    end
    

    get '/golfer/:id/edit' do

    end


    delete '/golfer/:id' do
        Golfer.destroy_all
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
