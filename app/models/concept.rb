class Concept < ActiveRecord::Base
  has_many :references
  has_many :quotes, through: :references
end
