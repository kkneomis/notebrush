class AddVotesToEntry < ActiveRecord::Migration
  def change
    add_column :entries, :total_votes, :integer
  end
end
