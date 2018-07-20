class AddUserToWritings < ActiveRecord::Migration[5.0]
  def change
    add_reference :writings, :user, foreign_key: true
  end
end
