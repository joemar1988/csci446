class AddAttachmentsPhotoToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :photo_file_name, :string
    add_column :users, :photo_content_type, :string
    add_column :users, :photo_file_size, :integer
    add_column :users, :photo_updated_at, :datetime
  	add_column :games, :user_id, :integer
	
	Game.all.each do |game|
		creator = User.create(:username => game.creator)
		game.creator_name = creator
		game.save
	end

	remove_column :games, :creator
  end

  def self.down
    remove_column :users, :photo_file_name
    remove_column :users, :photo_content_type
    remove_column :users, :photo_file_size
    remove_column :users, :photo_updated_at
  end
end
