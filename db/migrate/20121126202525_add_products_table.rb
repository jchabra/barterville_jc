class AddProductsTable < ActiveRecord::Migration
  def change
  	create_table :products do |t|
  		t.string :name
  		t.text :description
  		t.string :photo
  		t.string :condition
  		t.timestamps
  	end
  end
end
