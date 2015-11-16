class CreateUserTable < ActiveRecord::Migration
  def change
  	create_table :users do |t|

  		t.string :email
  		t.string :fname
  		t.string :lname
  		t.string :password
  	end
  end
end
