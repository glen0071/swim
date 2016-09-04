class Concept < ActiveRecord::Base
  has_many :references
  has_many :quotes, through: :references

  def self.search(term)
  where('LOWER(name) LIKE :query OR LOWER(name) LIKE :query', query: "%#{query.downcase}%")
end

end
