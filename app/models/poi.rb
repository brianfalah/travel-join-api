class Poi < ActiveRecord::Base
  attr_accessible :address, :category_id, :description, :latitude, :longitude, :name, :user_id

  geocoded_by :address
  reverse_geocoded_by :latitude, :longitude

  belongs_to :category

  def category_name
  	self.category.name
  end
end
