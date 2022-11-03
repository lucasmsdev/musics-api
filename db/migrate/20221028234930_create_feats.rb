class CreateFeats < ActiveRecord::Migration[7.0]
  def change
    create_table :feats do |t|
      t.references :artist, null: false, foreign_key: true
      t.references :music, null: false, foreign_key: true

      t.timestamps
    end
  end
end
