class Reference < ActiveRecord::Base
  belongs_to :concept
  belongs_to :quote

  belongs_to :user
end
