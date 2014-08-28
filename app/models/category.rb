class Category < ActiveRecord::Base
  attr_accessible :category_id, :name

  validates :category_id, :uniqueness => true
  validates :category_id, :name, :presence => true

  has_many :pois
end
