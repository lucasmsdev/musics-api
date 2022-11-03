class ArtistsController < ApplicationController

  def index
    @artists = Artist.all.order(:name)
  end

  def show
    @artist = Artist.find_by(slug: params[:slug])
  end

end
