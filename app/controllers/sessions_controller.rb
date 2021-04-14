class SessionsController < ApplicationController

    get '/login' do
        erb :"sessions/index"
    end

    get '/signin' do
        erb :"sessions/login"
    end

    post '/login' do
        golfer = Golfer.find_by(params[:username]) # find the user by Username
    
        if golfer && golfer.authenticate(params[:password])     # check to see if the userexist and password matches
            session[:golfer_id] = golfer.id #if does load into memory/sessions
            redirect '/golfer/show'
        else
            redirect "/login"
        end
    end

    get '/logout' do
        sessions.clear
        redirect "/"
    end

    get '/signup' do
        erb :"golfer/new"
    end

    post '/signup' do
        erb :"golfer/show"
    end

end