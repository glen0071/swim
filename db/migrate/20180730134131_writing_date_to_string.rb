class WritingDateToString < ActiveRecord::Migration[5.0]
  def change
    change_column :writings, :date, :string
  end
end
