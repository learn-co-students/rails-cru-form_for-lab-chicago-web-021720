class GenresController < ApplicationController

    def new
        @genre = Genre.new
    end 

    def create
        @genre = Genre.new(get_params)
        @genre.save
        redirect_to genre_path(@genre)
    end 
    
    def edit
        find_show
    end 
    
    def update
        find_show.update(get_params)
        redirect_to genre_path(@genre)
    end 
    
    def show
        find_show
    end
    
    private
    def find_show
        @genre = Genre.find(params[:id])
    end

    def get_params
        params.require(:genre).permit(:name)
    end 


end 
