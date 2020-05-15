class VideosController < ApplicationController
    
    get '/videos' do #index route
       if !is_logged_in?
           redirect '/login'
       end
       @vids = current_user.videos
       @vids = @vids.order(:entry_date)
       erb :'/videos/index'
    end

    get '/videos/new' do #new route
        if !is_logged_in?
            redirect '/login'
        end
        erb :'/videos/new'
    end

    post '/videos' do #create route
        @vid = current_user.videos.build(params)
        if @vid.save
            redirect "/videos/#{@vid.id}"
        else
            erb :'/videos/new'
        end
    end

    get '/videos/:id' do #show route
        if !is_logged_in?
            redirect '/login'
        end
        @vid = current_user.videos.find_by_id(params[:id])
        if @vid
            erb :'/videos/show'
        else
            redirect '/videos'
        end
    end

    get '/videos/:id/edit' do #edit route
        if !is_logged_in?
            redirect '/login'
        end
        @vid = current_user.videos.find_by_id(params[:id])
        if !@vid
            redirect '/videos'
        end
        erb :'/videos/edit'
    end

    patch '/videos/:id' do #update route
        @vid = current_user.videos.find_by_id(params[:id])
        if @vid 
            if @vid.update(title: params[:title], notes: params[:notes], entry_date: params[:entry_date])
                redirect "/videos/#{@vid.id}" 
            else
                # handle errors on edit form class error_massages
                erb :'/videos/edit'
            end
        else
            redirect '/videos'
        end
    end

    delete '/videos/:id' do #destroy route
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