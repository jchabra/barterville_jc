class RenameColumnBecauseSeriously < ActiveRecord::Migration
  def change
  	rename_column :notifications, :from_item, :from_product
  end
end
