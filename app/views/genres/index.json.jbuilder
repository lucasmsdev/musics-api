json.array! @genres do |genre|
  json.slug genre.slug
  json.name genre.name
end