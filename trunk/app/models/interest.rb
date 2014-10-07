class Interest < ActiveRecord::Base
  attr_accessible :interest_id, :name

  validates :interest_id, :uniqueness => true
  validates :interest_id, :name, :presence => true


  has_many    :groups_interests
  has_many    :groups, :through => :groups_interests  
  #hacer los mismo para users
end
