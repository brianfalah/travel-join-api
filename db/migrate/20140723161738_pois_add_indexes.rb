class PoisAddIndexes < ActiveRecord::Migration
  def change
  	add_index :pois, [:latitude, :longitude]
  end
end
