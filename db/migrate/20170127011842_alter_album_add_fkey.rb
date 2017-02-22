class AlterAlbumAddFkey < ActiveRecord::Migration[5.0]

  def up
    add_column("albums" , "band_id", :integer)
    add_index("albums" , "band_id")
  end

  def down
    remove_column("albums" , "band_id")
  end

end
