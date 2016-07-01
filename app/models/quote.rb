class Quote < ActiveRecord::Base
  belongs_to :publication
  has_many :examples
  has_many :concepts, through: :examples

  validates :text, length: { minimum: 5, too_short: 'Quote cannot be less than 5 characters long' }
end
