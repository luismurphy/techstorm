class AddNamesToUsers < ActiveRecord::Migration
  def up
  	execute("ALTER TABLE users ADD COLUMN first_name varchar(30);")
  	execute("ALTER TABLE users ADD COLUMN last_name varchar(30);")
  end

  def down
  	execute ("ALTER TABLE users DROP COLUMN first_name;")
  	execute ("ALTER TABLE users DROP COLUMN last_name;")
  end

end
