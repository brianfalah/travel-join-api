class CreateInterest < ActiveRecord::Migration
  def up
    create_table :interests do |t|
      t.integer :interest_id
      t.string :name

      t.timestamps
    end
    add_index :interests, :interest_id
    add_index :interests, :name
  end

  def down
    drop_table :interests
  end
end
