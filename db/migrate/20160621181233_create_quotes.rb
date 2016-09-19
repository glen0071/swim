class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.text :text
      t.references :author, index: true, foreign_key: true
      t.references :writing, index: true, foreign_key: true
      t.text :attribution

      t.timestamps null: false
    end
  end
end
