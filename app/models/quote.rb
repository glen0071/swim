class Quote < ActiveRecord::Base
  has_many :references
  has_many :concepts, through: :references
  belongs_to :author

  validates :text, length: { minimum: 5, too_short: 'Quote cannot be less than 5 characters long' }
end
