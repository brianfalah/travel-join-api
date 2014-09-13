class User < ActiveRecord::Base
  attr_accessible :facebook_id, :id, :email, :name, :surname
end
