class UsersController < ApplicationController
    
    get '/signup' do
        if is_logged_in?
            redirect '/videos'
        end
            erb :'/users/new'
    end

    post '/signup' do
        user = User.new(params)
        if user.save
            session[:user_id] = user.id
            redirect '/videos'
        else 
            erb :'/users/new'
        end
     end

end