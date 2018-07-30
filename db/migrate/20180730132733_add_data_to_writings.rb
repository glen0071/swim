class AddDataToWritings < ActiveRecord::Migration[5.0]
  def change
    add_column :writings, :date, :date
    add_column :writings, :location, :string
    add_column :writings, :notes, :text
  end
end
