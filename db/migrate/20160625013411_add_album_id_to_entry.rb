class AddAlbumIdToEntry < ActiveRecord::Migration
  def change
    add_column :entries, :album_id, :integer
  end
end
