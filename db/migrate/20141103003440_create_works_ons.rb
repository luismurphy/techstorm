class CreateWorksOns < ActiveRecord::Migration
  def up

  	execute("ALTER TABLE tasks ADD COLUMN tid serial;
  		ALTER TABLE tasks DROP CONSTRAINT tasks_pkey;
  		ALTER TABLE tasks ADD PRIMARY KEY (tid, pid);
  		ALTER TABLE tasks DROP COLUMN uid;")

  	execute("CREATE TABLE works_on (
  		uid integer REFERENCES users(id),
  		tid integer,
  		pid integer,
  		FOREIGN KEY (tid,pid) REFERENCES tasks(tid,pid),
  		PRIMARY KEY (uid,tid,pid));
  		")
  end

  def down
  	execute ("DROP TABLE works_on CASCADE;")
  	execute ("ALTER TABLE tasks ADD COLUMN uid serial;
  		ALTER TABLE tasks DROP PRIMARY KEY tasks_pkey;
  		ALTER TABLE tasks ADD PRIMARY KEY (uid, pid);
  		ALTER TABLE tasks DROP COLUMN tid;")
  end
end