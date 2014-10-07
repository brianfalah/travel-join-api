class GroupsInterests < ActiveRecord::Base
  attr_accessible :group_id, :interest_id

  belongs_to :group
  belongs_to :interest
end
