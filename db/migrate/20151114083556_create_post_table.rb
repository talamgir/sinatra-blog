class CreatePostTable < ActiveRecord::Migration
  def change
  	create_table :posts do |t|

  		t.text :content
  		t.string :user_id
  	end 
  end
end
