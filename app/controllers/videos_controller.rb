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
            @vid = current_user.videos.find_by_id(params[:id])
            erb :'/videos/show'
    end

    get '/videos/:id/edit' do
        if !is_logged_in?
            redirect '/login'
        end
        @vid = current_user.videos.find_by_id(params[:id])
        if session[:user_id] != @vid.user_id
            redirect '/videos'
        end
        erb :'/videos/edit'
    end

    patch '/videos/:id' do
        @vid = current_user.videos.find_by_id(params[:id])
        if @vid 
            @vid.update(title: params[:title], notes: params[:notes], entry_date: params[:entry_date])
            @vid.save
        end
        redirect "/videos/#{@vid.id}"
    end

    delete '/videos/:id' do
        if !is_logged_in?
            redirect '/login'
        end
        @vid = current_user.videos.find_by_id(params[:id])
        if @vid
            @vid.destroy
        end
        redirect '/videos'
    end

end