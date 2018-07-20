class RemoveUserFromAuthors < ActiveRecord::Migration[5.0]
  def change
    remove_reference :authors, :user, foreign_key: true
  end
end
