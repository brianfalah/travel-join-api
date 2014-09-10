class Event < ActiveRecord::Base
	attr_accessible :name, :description, :poi_id, :from_date, :to_date

	belongs_to  :poi

	def serializable_hash(options)
		super(
			:only => [:id, :name, :description, :poi_id, :from_date, :to_date]
		)
	end
end
