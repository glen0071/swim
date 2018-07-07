class Writing < ActiveRecord::Base
  has_many :quotes

  has_many :references, through: :quotes
  has_many :concepts, through: :references

  belongs_to :author

  def title_with_alt_title
    alt_title.blank? ? title : "#{title}   (#{alt_title})"
  end
end
