class CreateReferences < ActiveRecord::Migration
  def change
    create_table :references do |t|
      t.references :quote
      t.references :concept

      t.timestamps null: false
    end
  end
end
