class CreateWritings < ActiveRecord::Migration
  def change
    create_table :writings do |t|
      t.string :title
      t.string :alt_title
      t.string :publications
      t.references :author, index: true, foreign_key: true
    end
  end
end
