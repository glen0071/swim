class Concept < ActiveRecord::Base
  has_many :references
  has_many :quotes, through: :references
  before_save :downsize_name

  validates_presence_of :name
  validates_uniqueness_of :name

  belongs_to :user

  def add_quote(new_quote)
    duplicate = quotes.any? {|related_quote| related_quote === new_quote }
    self.quotes << new_quote unless duplicate
  end

  def downsize_name
    self.name.downcase! unless self.name.include? 'God'
  end

  def self.search(_term)
    where('LOWER(name) LIKE :query OR LOWER(name) LIKE :query', query: "%#{query.downcase}%")
  end
end
