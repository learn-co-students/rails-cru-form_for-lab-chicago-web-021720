class SongsController < ApplicationController

    def index
        @songs = Song.all
    end

    def show
        find_and_set_song_by_id
    end

    def new
        @song = Song.new
    end
    
    def create
        song = Song.new(song_params(:name, :artist_id, :genre_id))
        if song.save
            redirect_to song_path(song)
        else 
            raise song
        end
    end

    def edit
        find_and_set_song_by_id
    end

    def update
        find_and_set_song_by_id
        @song.update(song_params(:name, :artist_id, :genre_id))
        redirect_to song_path(@song)
    end

    private

    def find_and_set_song_by_id
        @song = Song.find(params[:id])
    end

    def song_params(*args)
        params.require(:song).permit(*args)
    end

end
