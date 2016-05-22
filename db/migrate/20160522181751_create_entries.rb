class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :title
      t.text :description
      t.references :user, index: true
      t.string :tag
      t.string :reel

      t.timestamps
    end
  end
end
