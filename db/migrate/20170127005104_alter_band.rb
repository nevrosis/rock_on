class AlterBand < ActiveRecord::Migration[5.0]

  def up
    add_column("bands" , "active", :bool, :default => false)
    add_index("bands" , "name")
  end

  def down
    remove_index("bands" , "name")
    remove_column("bands" , "active")
  end

end
