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
        song = Song.create(params[:song])
        params[:genre_ids].each do |genre|
            SongGenre.create(song_id: song.id, genre_id: genre.to_i) 
        end
        redirect "/songs/#{song.slug}"
    end

    get '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        erb :"songs/show"
    end
end