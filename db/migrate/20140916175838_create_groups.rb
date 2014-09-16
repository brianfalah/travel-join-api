class CreateGroups < ActiveRecord::Migration
  def change
  	create_table :groups do |t|
      t.string  :name
      t.string  :description
      t.integer :user_id
      t.integer :group_type
      t.string  :password

      t.timestamps
    end
  end
end
