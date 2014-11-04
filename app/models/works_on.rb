class WorksOn < ActiveRecord::Base

	belongs_to :users
	belongs_to :tasks
end
