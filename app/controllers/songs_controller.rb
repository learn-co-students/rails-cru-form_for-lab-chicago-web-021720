class SongsController < ApplicationController

    def index
        @songs = Song.all
    end 
    
    def new
        @song = Song.new
    end 
 
    def create
        @song = Song.new(get_params)
        @song.save
        redirect_to song_path(@song)
    end 
    
    def edit
        find_show
    end 
    
    def update
        find_show.update(get_params)
        redirect_to song_path(@song)
    end 
    
    def show
        find_show
    end
    
    private
    def find_show
        @song = Song.find(params[:id])
    end

    def get_params
        params.require(:song).permit(:name, :artist_id, :genre_id)
    end 

end 
