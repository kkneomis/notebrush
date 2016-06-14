class CreateReposts < ActiveRecord::Migration
  def change
    create_table :reposts do |t|
      t.integer :entry_id
      t.integer :poster_id
      t.integer :reposter_id

      t.timestamps null: false
    end
  end
end
