class Roles < ActiveRecord::Migration
  def self.up
    create_table :roles do |t|
      t.string :access_level, :null => false
    end
    Role.create :access_level => "admin"
    Role.create :access_level => "member"
    Role.create :access_level => "guest"    
  end

  def self.down
  end
end
