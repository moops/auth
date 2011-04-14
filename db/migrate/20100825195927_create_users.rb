class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :user_name
      t.string :hashed_password
      t.string :salt
      t.integer :gender
      t.integer :authority
      t.date :born_on
      t.datetime :last_login_at

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
