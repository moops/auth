class CreateAddresses < ActiveRecord::Migration
  def self.up
    create_table :addresses do |t|
      t.integer :user_id
      t.string :address
      t.string :city
      t.string :state
      t.string :country
      t.string :zip

      t.timestamps
    end
  end

  def self.down
    drop_table :addresses
  end
end
