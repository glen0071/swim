class Author < ActiveRecord::Base
  validates :name, length: { minimum: 1, too_short: 'Author name cannot be blank' }

  has_many :writings
  has_many :quotes

  has_many :references, through: :quotes
  has_many :concepts, through: :references
end
