class AddReadColumnToNotifications < ActiveRecord::Migration
  def change
  	add_column :notifications, :read, :boolean, :default => true
  end
end
