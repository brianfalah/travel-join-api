class Poi < ActiveRecord::Base
  attr_accessible :address, :category_id, :description, :latitude, :longitude,
    :name, :user_id, :events_attributes

  geocoded_by :address
  reverse_geocoded_by :latitude, :longitude

  belongs_to  :category
  has_many    :events, :dependent => :destroy

  accepts_nested_attributes_for :events, :allow_destroy => true

  def category_name
    self.category.name
  end

  def serializable_hash(options)
    super(
      :only => [:id, :name, :category_id, :description,
                :latitude, :longitude, :user_id],
      :methods => %w(category_name),
      :include => [:events]
    )
  end

end
