# == Schema Information
#
# Table name: notifications
#
#  id           :integer          not null, primary key
#  subject      :string(255)
#  message      :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  to_user      :integer
#  to_product   :integer
#  from_user    :integer
#  from_product :integer
#  unread       :boolean          default(TRUE)
#  open         :boolean          default(TRUE)
#

class Notification < ActiveRecord::Base
	belongs_to :user
end
