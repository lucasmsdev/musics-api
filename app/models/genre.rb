class Genre < ApplicationRecord
  has_and_belongs_to_many :musics
  
  validates :name, :slug, presence: true
  validates :name, :slug, uniqueness: true
  

  before_validation :set_slug

  def set_slug
    self.slug = name.parameterize
  end

end
