class GenresController < ApplicationController
  def index
    @genres = Genre.all.order(:name)
  end

  def show
    @genre = Genre.find_by(slug: params[:slug])
    @musics =  Genre.find_by(slug: "rap").musics
  
  end

end
