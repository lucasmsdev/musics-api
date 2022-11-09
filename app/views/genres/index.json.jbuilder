json.array! @genres do |genre|
  json.slug genre.slug
  json.name genre.name
  json.musics_count genre.musics.count
  json.link genre_url(slug: genre.slug)
end