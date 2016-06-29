class CreateExamples < ActiveRecord::Migration
  def change
    create_table :examples do |t|
      t.references :quote
      t.references :concept

      t.timestamps null: false
    end
  end
end
