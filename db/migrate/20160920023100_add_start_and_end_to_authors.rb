class AddStartAndEndToAuthors < ActiveRecord::Migration[5.0]
  def change
    change_table :authors do |t|
      t.date :start
      t.date :end
    end
  end
end
