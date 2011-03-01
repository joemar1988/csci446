class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :username, :null => false
      t.string :password, :null => false
      t.string :firstname
      t.string :lastname
      t.string :email

      t.timestamps
    end

  def self.down
    drop_table :users
  end
end
