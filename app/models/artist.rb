class Artist < ApplicationRecord
  validates :name, :slug, presence: true
  validates :name, :slug, uniqueness: true


end
