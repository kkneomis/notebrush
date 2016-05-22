class AddVidToVideo < ActiveRecord::Migration
  def change
    add_column :videos, :vid, :string
  end
end
