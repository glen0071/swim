class Author < ActiveRecord::Base

    validates :name, length: { minimum: 1, too_short: "Author name cannot be blank"}

    has_many :works
    # has_many :quotes
    
end
