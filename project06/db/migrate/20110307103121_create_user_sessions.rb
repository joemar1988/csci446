class CreateUserSessions < ActiveRecord::Migration
  def self.up
    create_table :user_sessions do |t|
      t.string :username
      t.string :password
      add_column :users, :persistence_token, :string
      t.timestamps
    end
  end

  def self.down
    drop_table :user_sessions
  end
end
