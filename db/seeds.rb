# db/seeds.rb
require 'csv'

# Traditional way
genres = ["MPB", "Hard Rock", "Pop", "Vocais", "Metal", "Funk", "Country", "Pop", "Rock", "R&B", "Art Rock", "Soft Rock", "Rap", "Rock Garagem", "Rock Alternativo", "Folk Rock", "Jazz", "Pop Rock", "Dance Rock", "Acoustic Rock", "Soul", "Rock Clássico", "Folk", "Blues", "Indie", "New Wave", "Alternativa", "Barbershop", "Viking Metal", "Disco", "Grunge", "Country", "Dance", "Psicodelica", "MPB", "Blues", "Acappella", "Opera", "Easy Listening", "Heavy Metal"]
genres.each { |name| Genre.find_or_create_by(name: name) }

# CSV way
csv = CSV.open('./db/data/artists.csv', headers: true)
csv.each { |row| Artist.find_or_create_by!(name: row['name'], slug: row['name'].parameterize) }

csv = CSV.open('./db/data/musics.csv', headers: true)
csv.each { |row| Music.find_or_create_by!(name: row['name'], artist_id: row['artist_id'], year: row['year'], image_url: row['image_url'], youtube_url: row['youtube_url']) }

csv = CSV.open('./db/data/genres_musics.csv', headers: true, col_sep: ';')
csv.each do |row|
   genre = Genre.find_by(id: row['genre_id']) 
   music = Music.find_by(id: row['music_id'])
   next unless genre && music
   genre.musics << music
end


csv.each do |row|
   artist = Artist.find_by(id: row['id'])
   music = Music.find_by(id: row['artist_id'])
   artist.musics << music
end



