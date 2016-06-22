class ChangeQuoteNameToText < ActiveRecord::Migration
  def change
    rename_column :quotes, :name, :text
    change_column :quotes, :text, :text
  end
end
