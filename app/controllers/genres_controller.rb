class GenresController < ApplicationController
  def index
    @genres = Genre.all.order(:name)
  end

  def show
    @genre = Genre.find_by(slug: params[:slug])
  end

end
