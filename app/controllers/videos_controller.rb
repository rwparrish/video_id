class VideosController < ApplicationController
    
    get '/videos' do
       if !is_logged_in?
           redirect '/login'
       end
       @vids = current_user.videos
       @vids = @vids.order(:entry_date)
       erb :'/videos/index'
    end

    get '/videos/new' do 
        if !is_logged_in?
            redirect '/login'
        end
    end

    post '/videos/new' do
    end

    get '/videos/:id' do
        if !is_logged_in?
            redirect '/login'
        end
    end

    get '/videos/:id/edit' do
        if !is_logged_in?
            redirect '/login'
        end
    end

    patch '/videos/:id/' do
    end

    delete '/videos/:id' do
        if !is_logged_in?
            redirect '/login'
        end
    end

end