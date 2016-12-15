class Writing < ActiveRecord::Base
  has_many :quotes

  has_many :references, through: :quotes
  has_many :concepts, through: :references

  belongs_to :author
end
