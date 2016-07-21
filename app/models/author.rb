class Author < ActiveRecord::Base
  validates :name, length: { minimum: 1, too_short: 'Author name cannot be blank' }

  has_many :publications
  has_many :quotes, through: :publications
end
