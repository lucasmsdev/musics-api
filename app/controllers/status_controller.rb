class StatusController < ApplicationController
  def index
    render json: {
      app_name: "MusicPro",
      version: 0.1,
      server: :ok
    }
  end
end
