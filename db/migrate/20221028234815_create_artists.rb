class CreateArtists < ActiveRecord::Migration[7.0]
  def change
    create_table :artists do |t|
      t.string :name, null: false    
      t.string :slug, null: false, unique: true

      t.timestamps
    end
  end
end
