class CreatePowerUsers < ActiveRecord::Migration[5.0]

  def up
    create_table :power_users do |t|
      t.string "first_name", :limit => 25
      t.string "last_name", :limit => 25
      t.string "email", :limit => 100
      t.string "password_digest"
      t.timestamps
    end

    add_index("power_users" , "email")

  end

  def down
    drop_table :power_users
  end

end
