class SessionsController < ApplicationController

    get '/login' do
        erb :"sessions/login"
    end

    post '/login' do
        golfer = Golfer.find_by(params[:username]) # find the user by Username
        
        if golfer && golfer.authenticate(params[:golfer][:password])     # check to see if the userexist and password matches
            session[:golfer_id] = golfer.id #if does load into memory/sessions

            redirect "/golfer/#{golfer.id}"
        else
            redirect "/login"
        end
    end

    get '/logout' do
        session.clear
        redirect "/"
    end

    get '/signup' do
        erb :"golfer/new"
    end

    post '/signup' do 
        @golfer = Golfer.new(params)
        if @golfer && @golfer.save
         session[:golfer_id] = @golfer.id
         redirect"/golfer/#{session[:golfer_id]}"
        else
         redirect "/login"
        end
       
    end

end