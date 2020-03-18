class GenresController < ApplicationController

    def index
        @genres = Genre.all
    end

    def show
        find_and_set_genre_by_id
    end

    def new
        @genre = Genre.new
    end
    
    def create
        genre = Genre.new(genre_params(:name))
        if genre.save
            redirect_to genre_path(genre)
        else 
            raise genre
        end
    end

    def edit
        find_and_set_genre_by_id
    end

    def update
        find_and_set_genre_by_id
        @genre.update(genre_params(:name))
        redirect_to genre_path(@genre)
    end

    private

    def find_and_set_genre_by_id
        @genre = Genre.find(params[:id])
    end

    def genre_params(*args)
        params.require(:genre).permit(*args)
    end

end
