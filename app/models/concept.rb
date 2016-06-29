class Concept < ActiveRecord::Base

  has_many :examples
  has_many :quotes, through: :examples

end
