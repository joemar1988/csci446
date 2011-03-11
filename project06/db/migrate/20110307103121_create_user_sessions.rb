class CreateUserSessions < ActiveRecord::Migration
  def self.up
    create_table :user_sessions do |t|
      t.string :username
      t.string :password
      remove_column :roles, :access_level, :string
      add_column :roles, :name, :string
      t.timestamps
    end
  end

  def self.down
    drop_table :user_sessions
  end
end
