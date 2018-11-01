# require 'rack-flash'
class SongsController < ApplicationController
    # enable :sessions
    # use Rack::Flash

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
        # flash[:message] = "Successfully created song."
        redirect "/songs/#{song.slug}"
    end

    get '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        erb :"songs/show"
    end

    get '/songs/:slug/edit' do
        @song = Song.find_by_slug(params[:slug])
        @artists = Artist.all
        @genres = Genre.all
        erb :"songs/edit"
    end

    patch '/songs/:slug' do
        song = Song.find_by_slug(params[:slug])
        song.update(params[:song])
        params[:genre_ids].each do |genre|
            SongGenre.find_or_create_by(song_id: song.id, genre_id: genre.to_i)
        end
        # flash[:message] = "Successfully updated song."
        redirect "/songs/#{song.slug}"
    end
end