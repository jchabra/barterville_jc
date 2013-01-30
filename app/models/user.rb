# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string(255)
#  first_name      :string(255)
#  last_name       :string(255)
#  zip             :integer
#  photo           :string(255)
#  bio             :text
#  password_digest :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  email           :string(255)
#

class User < ActiveRecord::Base
	has_many :products
	has_many :notifications

	validates :username, :presence => true
	validates :username, :uniqueness => true
	validates :first_name, :length => { :minimum => 3 }
	validates :last_name, :length => { :minimum => 3 }
	validates :zip, :length => { :minimum => 5 }
	# validates :photo, :presence => true
	validates :bio, :length => { :minimum => 3 }
	validates :password, :length => { :in => 1..20 }
	
	has_secure_password
	
	mount_uploader :photo, PhotoUploader
end
