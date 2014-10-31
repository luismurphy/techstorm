class CreateProjects < ActiveRecord::Migration
  def up
    # create_table :projects do |t|
    #   t.timestamps
    # end
	execute ("
    	CREATE TABLE projects (
    		id SERIAL PRIMARY KEY,
    		creator integer REFERENCES users(id),
    		created_at timestamp,
    		name	varchar(20),
    		description	text
    		);")
  end

  def down
		execute ("DROP TABLE projects CASCADE;")
	end
end
