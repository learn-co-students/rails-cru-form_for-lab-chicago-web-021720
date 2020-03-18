class ArtistsController < ApplicationController

    def new
        @artist = Artist.new
    end 

    def create
        @artist = Artist.new(get_params)
        @artist.save
        redirect_to artist_path(@artist)
    end 
     
    def edit
        find_show
    end 
    
    def update
        find_show.update(get_params)
        redirect_to artist_path(@artist)
    end 
    
    def show
        find_show
    end
    
    private
    def find_show
        @artist = Artist.find(params[:id])
    end

    def get_params
        params.require(:artist).permit(:name, :bio)
    end 


end 
