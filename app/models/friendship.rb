class Friendship < ActiveRecord::Base
  belongs_to :invitation, class_name: "User", foreign_key: :from_id
	belongs_to :invited, class_name: "User", foreign_key: :to_id
	
	validates :from_id, presence: true
	validates :to_id, presence: true
		
end
