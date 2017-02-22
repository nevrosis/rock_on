class AlterAlbum < ActiveRecord::Migration[5.0]

  def up
    add_column("albums" , "active", :bool, :default => false)
    add_index("albums" , "title")
  end

  def down
    remove_index("albums" , "title")
    remove_column("albums" , "active")
  end

end
