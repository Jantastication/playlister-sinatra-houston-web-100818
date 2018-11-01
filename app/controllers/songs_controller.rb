class SongsController < ApplicationController
    get '/songs' do 
        @songs = Song.all
        erb :"/songs/index"
    end

    get '/songs/new' do 
        @genres = Genre.all
        @artists = Artist.all
        erb :"songs/new"
    end

    post '/songs' do
        binding.pry
        Song.create(params[:song])
    end

    get '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        erb :"songs/show"
    end
end