# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  photo       :string(255)
#  condition   :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#

class Product < ActiveRecord::Base
	belongs_to :user
	mount_uploader :photo, PhotoUploader
	validates :name, :presence => true
	validates :description, :length => { :minimum => 3 }
	# validates :photo, :presence => true
	validates :condition, :length => { :minimum => 3 }

	def self.text_search(query)
  		self.where("name @@ :q or description @@ :q", :q => query)
  	end
end


