class UsersController < ApplicationController
    
    get '/signup' do
        if is_logged_in?
            redirect '/videos'
        end
            erb :'/users/new'
    end

    post '/signup' do
        binding.pry
        user = User.new(params)

    end

end