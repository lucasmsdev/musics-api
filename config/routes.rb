Rails.application.routes.draw do
  scope defaults: { format: :json } do

    root to: "status#index"

    controller :genres do
      get '/genres', action: :index
      get '/genres/:slug', action: :show
    end

    controller :musics do
      get '/musics', action: :index
    end

    controller :artists do
      get '/artists', action: :index
      get '/artists/:slug', action: :show
    end

    

  end
end