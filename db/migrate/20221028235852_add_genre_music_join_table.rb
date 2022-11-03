class AddGenreMusicJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :genres, :musics do |t|
      t.index [:genre_id, :music_id]
      t.index [:music_id, :genre_id]
    end
  end
end
