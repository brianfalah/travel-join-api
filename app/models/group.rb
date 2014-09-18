class Group < ActiveRecord::Base
	attr_accessible :name, :description, :user_id, :group_type, :password

	#usuario que creo este grupo
	belongs_to :user
	#usuarios que se unieron al grupo, el creador deberia estar incluido en este conjunto
	has_and_belongs_to_many :users, :join_table => :groups_users

	def serializable_hash(options)
		super(
			:only => [:id, :name, :description, :user_id, :group_type, :password]
		)
	end
end
