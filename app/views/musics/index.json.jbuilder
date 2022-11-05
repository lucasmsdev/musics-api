json.array! @musics do |music|
  json.name music.name
  json.artist_id music.artist_id
  json.year music.year
  json.youtube_url music.youtube_url
  json.image_url music.image_url
end