class GroupsPoi < ActiveRecord::Base
	attr_accessible :group_id, :poi_id

	belongs_to :group
	belongs_to :poi
end
