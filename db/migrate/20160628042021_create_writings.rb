class CreateWritings < ActiveRecord::Migration
  def change
    create_table :writings do |t|
      t.string :title
      t.string :alt_title
      t.references :publications
    end
  end
end
