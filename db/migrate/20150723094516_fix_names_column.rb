class FixNamesColumn < ActiveRecord::Migration
  def change
    rename_column :contacts, :names, :name
  end
  
end
