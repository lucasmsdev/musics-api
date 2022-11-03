# db/seeds.rb
require 'csv'

# Traditional way
genres = ["MPB", "Hard Rock", "Pop", "Vocais", "Metal", "Funk", "Country", "Pop", "Rock", "R&B", "Art Rock", "Soft Rock", "Rap", "Rock Garagem", "Rock Alternativo", "Folk Rock", "Jazz", "Pop Rock", "Dance Rock", "Acoustic Rock", "Soul", "Rock Clássico", "Folk", "Blues", "Indie", "New Wave", "Alternativa", "Barbershop", "Viking Metal", "Disco", "Grunge", "Country", "Dance", "Psicodelica", "MPB", "Blues", "Acappella", "Opera", "Easy Listening", "Heavy Metal"]
genres.each { |name| Genre.find_or_create_by(name: name) }

# CSV way
csv = CSV.open('./db/data/artists.csv', headers: true)
csv.each { |row| Artist.find_or_create_by(name: row['name']) }

csv = CSV.open('./db/data/musics.csv', headers: true)
csv.each { |row| Music.find_or_create_by(name: row['name']) }









