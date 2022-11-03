json.array! @artists do |artist|
  json.slug artist.slug
  json.name artist.name
end