class AddColumnsToNotificationsTable < ActiveRecord::Migration
  def change
  	add_column :notifications, :from_user, :integer
  	add_column :notifications, :from_item, :integer
  	rename_column :notifications, :user_id, :to_user
  	rename_column :notifications, :product_id, :to_product
  end
end
