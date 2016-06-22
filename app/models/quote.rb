class Quote < ActiveRecord::Base
  belongs_to :work
  
  validates :text, length: { minimum: 5, too_short: "Quote cannot be less than 5 characters long"}
  
end
