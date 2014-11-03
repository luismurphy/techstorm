class CreateCollaborates < ActiveRecord::Migration
  def up
  	execute("CREATE TABLE collaborates (
  		uid integer REFERENCES users(id),
  		pid integer REFERENCES projects(id),
  		PRIMARY KEY (uid,pid));
  		")
  end

  def down
  	execute ("DROP TABLE collaborates CASCADE;")
  end
end
