class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.text :text
      t.references :publication, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
