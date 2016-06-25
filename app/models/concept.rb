class Concept < ActiveRecord::Base

  has_many :refences
  has_many :quotes, through: :references

end
