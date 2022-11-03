class CreateMusics < ActiveRecord::Migration[7.0]
  def change
    create_table :musics do |t|
      t.string :name, null: false
      t.integer :year, null: false
      t.boolean :brazilian, null: false, default: false
      t.string :youtube_url, null: false
      t.string :image_url
      t.references :artist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
