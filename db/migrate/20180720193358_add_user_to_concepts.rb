class AddUserToConcepts < ActiveRecord::Migration[5.0]
  def change
    add_reference :concepts, :user, foreign_key: true
  end
end
