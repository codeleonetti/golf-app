class SessionsController < ApplicationController

    get '/login' do
        erb :"sessions/index"
    end

    get '/signin' do
        erb :"sessions/sessions_login"
    end

    post '/login' do
        golfer = Golfer.find_by(username: params[:username]) # find the user by Username
        if golfer && golfer.authenticate(params[:password])     # check to see if the userexist and password matches
            session[:golfer_id] = golfer.id #if does load into memory/sessions
            redirect '/golfer/show'
        else
            redirect "/golf_course"
        end
    end

    get '/signup' do
        erb :"golfer/new_golfer"
    end

    post '/signup' do
        erb :"golfer/golfer_show"
    end

end