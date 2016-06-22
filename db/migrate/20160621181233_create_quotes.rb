class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.string :name
      t.references :work, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
