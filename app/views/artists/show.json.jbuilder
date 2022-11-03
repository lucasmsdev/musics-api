json.slug @artist.slug
json.name @artist.name
json.musics @artist.musics do |music|
  json.name music.name
  json.url music.youtube_url
  json.genres music.artists.pluck(:name)
end

