class ArtistsController < ApplicationController

    def index
        @artists = Artist.all
    end

    def show
        find_and_set_artist_by_id
    end

    def new
        @artist = Artist.new
    end
    
    def create
        artist = Artist.new(artist_params(:name, :bio))
        if artist.save
            redirect_to artist_path(artist)
        else 
            raise artist
        end
    end

    def edit
        find_and_set_artist_by_id
    end

    def update
        find_and_set_artist_by_id
        @artist.update(artist_params(:name, :bio))
        redirect_to artist_path(@artist)
    end

    private

    def find_and_set_artist_by_id
        @artist = Artist.find(params[:id])
    end

    def artist_params(*args)
        params.require(:artist).permit(*args)
    end

end
