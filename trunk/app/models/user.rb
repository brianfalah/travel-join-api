class User < ActiveRecord::Base
  attr_accessible :facebook_id, :email, :name, :surname
end
