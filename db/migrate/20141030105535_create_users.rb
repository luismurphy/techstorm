class CreateUsers < ActiveRecord::Migration
	def up
    #create_table :users do |t|
    #t.timestamps
	#end

    execute ("
    	CREATE TABLE users (
    		id SERIAL PRIMARY KEY,
    		email	varchar(40) UNIQUE,
    		password_digest	varchar(255),
    		user_photo_link	text,
    		field_of_work	varchar(40),
    		ranking	int,
    		private	boolean,
    		user_info	text
    		);")
	end

	def down
		execute ("DROP TABLE users CASCADE;")
	end
end
