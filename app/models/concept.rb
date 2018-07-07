class Concept < ActiveRecord::Base
  has_many :references
  has_many :quotes, through: :references
  before_save :downsize_name

  validates_presence_of :name
  validates_uniqueness_of :name

  def downsize_name
    self.name.downcase!
  end

  def self.search(_term)
    where('LOWER(name) LIKE :query OR LOWER(name) LIKE :query', query: "%#{query.downcase}%")
end
end
