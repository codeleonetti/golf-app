class GolfersController < ApplicationController

    get '/golfer' do
        erb :golfer
    end

    get '/golfer/:id' do
        erb :golfer/show
    end

    get '/golfer/:new' do
       
    end

    get '/golfer/:id/edit' do

    end

    post '/golfer/' do
        Golfer,create
    end

    delete '/golfer/:id' do
        Golfer.destroy
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
