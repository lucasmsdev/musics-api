class MusicsController < ApplicationController
  def index
    @musics = Music.all.order(:name)
  end
end