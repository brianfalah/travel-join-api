# encoding: utf-8
class CreateCategories < ActiveRecord::Migration
  def up
  	create_table :categories do |t|
  		t.integer :category_id
      t.string :name

      t.timestamps
    end                 
    add_index :categories, :category_id
    add_index :categories, :name
  end

  def down
  	drop_table :categories
  end
end
