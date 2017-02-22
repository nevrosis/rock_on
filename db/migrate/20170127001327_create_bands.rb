class CreateBands < ActiveRecord::Migration[5.0]

  def up
    create_table :bands do |t|
      t.string "name", :limit => 50
      t.string "website", :default => ''
      t.timestamps
    end
  end

  def down
    drop_table :bands
  end

end
