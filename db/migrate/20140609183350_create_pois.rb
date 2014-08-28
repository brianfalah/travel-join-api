class CreatePois < ActiveRecord::Migration
  def change
    create_table :pois do |t|
      t.string :name
      t.string :description
      t.decimal :latitude, :precision => 10, :scale => 6
      t.decimal :longitude, :precision => 10, :scale => 6
      t.string :address
      t.integer :category_id
      t.integer :user_id

      t.timestamps
    end
  end
end
