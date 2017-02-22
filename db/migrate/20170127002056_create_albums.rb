class CreateAlbums < ActiveRecord::Migration[5.0]

  def up
    create_table :albums do |t|
      t.string "title", :limit => 100
      t.number "year", :default => 0
      t.timestamps
    end
  end

  def down
    drop_table :albums
  end

end
