class HowManyMigrationsCanIRun < ActiveRecord::Migration
  def change
  	rename_column :notifications, :read, :unread
  	add_column :notifications, :open, :boolean, :default => true
  end
end
