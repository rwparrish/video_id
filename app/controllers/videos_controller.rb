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
        erb :'/videos/new'
    end

    post '/videos/new' do
        @vid = current_user.videos.build(params)
        if @vid.save
            redirect "/videos/#{@vid.id}"
        else
            erb :'/videos/new'
        end
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