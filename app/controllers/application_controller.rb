require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, 'secret'
    register Sinatra::Flash

  end

  get "/" do
    erb :"home"
  end


  helpers do
    def logged_in?
      session[:golfer_id]
    end

    def current_user
      @current_user ||= Golfer.find_by(id: session[:golfer_id])
    end
  end

  
end
