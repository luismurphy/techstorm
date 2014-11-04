class UpdateUserTable < ActiveRecord::Migration
  def up
  	execute ("ALTER TABLE users ADD COLUMN interest text;")
  	execute ("ALTER TABLE users ADD COLUMN location text;")
  	execute ("ALTER TABLE users ADD COLUMN facebook text;")
  	execute ("ALTER TABLE users ADD COLUMN twitter text;")
  	execute ("ALTER TABLE users ADD COLUMN linkedin text;")
  	execute ("ALTER TABLE users ADD COLUMN github text;")
  end
end