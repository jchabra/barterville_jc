class AddNotificationsTable < ActiveRecord::Migration
  def change
  	create_table :notifications do |t|
  		t.string :subject
  		t.text :message
  		t.timestamps
  	end
  end
end
