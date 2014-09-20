class CreateGroupsPois < ActiveRecord::Migration
	def change
		create_table :groups_pois do |t|
			t.integer :group_id
			t.integer :poi_id
			t.timestamps
		end
	end
end
