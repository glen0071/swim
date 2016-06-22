class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.string :name
      t.references :author, index: true, foreign_key: true
      t.date :publication_year

      t.timestamps null: false
    end
  end
end
