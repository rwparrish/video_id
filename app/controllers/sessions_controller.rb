class SessionsController < ApplicationController
    
    get '/login' do 
       if is_logged_in?
        redirect '/videos'
       end
       erb :'/sessions/login'
    end

    post '/login' do
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect '/videos'
        else
            erb :'/sessions/login'
        end
    end

    get '/logout' do
        if is_logged_in?
            session.clear
        end
        redirect '/'
    end

end