class User < ActiveRecord::Base
  attr_accessible :facebook_id, :id, :email, :name, :surname

  #relacion para los grupos a los que pertenece el usuario
  has_and_belongs_to_many :groups, :join_table => :groups_users
  #relacion para los grupos creados por el usuario
  has_many :groups_owned, class_name: "Group"  
end
