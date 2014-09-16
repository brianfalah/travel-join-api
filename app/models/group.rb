class Group < ActiveRecord::Base
	attr_accessible :name, :description, :user_id, :group_type, :password

	belongs_to  :user

	def serializable_hash(options)
		super(
			:only => [:id, :name, :description, :user_id, :group_type, :password]
		)
	end
end
