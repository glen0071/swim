class Concept < ActiveRecord::Base
  has_many :references
  has_many :quotes, through: :references

  validates_presence_of :name

  def self.search(_term)
    where('LOWER(name) LIKE :query OR LOWER(name) LIKE :query', query: "%#{query.downcase}%")
end
end
