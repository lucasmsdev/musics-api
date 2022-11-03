class Music < ApplicationRecord
  belongs_to :artist
  has_and_belongs_to_many :genres

  validates :name, presence: true

  
  
end
