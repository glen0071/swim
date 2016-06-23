class Publication < ActiveRecord::Base

  validates :name, length: { minimum: 1, too_short: "Name cannot be blank"}

  belongs_to :author

end
