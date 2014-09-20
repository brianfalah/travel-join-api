class Group < ActiveRecord::Base
	attr_accessible :name, :description, :user_id, :group_type, :password

	#usuario que creo este grupo
	belongs_to :user

	has_many :groups_users
	#usuarios que se unieron al grupo, el creador deberia estar incluido en este conjunto
	has_many :users, :through => :groups_users

	has_many :groups_pois
	has_many :pois, :through => :groups_pois

	def serializable_hash(options)
		super(
			:only => [:id, :name, :description, :user_id, :group_type, :password]
		)
	end
end
