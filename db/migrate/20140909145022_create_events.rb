class CreateEvents < ActiveRecord::Migration
  def change
  	create_table :events do |t|
      t.string :name
      t.string :description
      t.integer :poi_id
      t.datetime :from_date
      t.datetime :to_date

      t.timestamps
    end
  end
end
