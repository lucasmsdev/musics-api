class Artist < ApplicationRecord
  has_many :musics
  validates :name, :slug, presence: true
  validates :name, :slug, uniqueness: true


end
