require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    erb :"home"
  end


  helpers do
    def logged_in?
      session[:golfer.id]
    end

    def current_user
      @golfer ||= Golfer.find_by(id: session[:golfer.id])
    end
  end

  
end
