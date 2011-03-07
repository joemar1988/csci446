class CreateRoles < ActiveRecord::Migration
  def self.up
    Role.create :access_level => "admin"
    Role.create :access_level => "member"
    Role.create :access_level => "guest"    
  end

  def self.down
    drop_table :roles
  end
end
