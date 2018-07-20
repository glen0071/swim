class Quote < ActiveRecord::Base
  has_many :references
  has_many :concepts, through: :references
  belongs_to :author
  belongs_to :writing

  belongs_to :user

  validates :text, length: { minimum: 5, too_short: 'Quote cannot be less than 5 characters long' }

  def add_concept(new_concept)
    duplicate = concepts.any? {|related_concept| related_concept === new_concept }
    self.concepts << new_concept unless duplicate
  end
end
