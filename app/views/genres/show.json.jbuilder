json.slug @genre.slug
json.name @genre.name
json.musics @musics do |music|
  json.name music.name
  json.url music.youtube_url
  json.genres music.genres.pluck(:name)
end

