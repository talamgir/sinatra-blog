class CreateProfileTable < ActiveRecord::Migration
  def change
	create_table :profiles do |t|
	
	t.text :about_me
	t.string :location
	t.integer :user_id
	end
  end
end
