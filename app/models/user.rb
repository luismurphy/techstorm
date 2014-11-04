class User < ActiveRecord::Base
	has_secure_password
	has_many :sends
	has_many :messages, :through => :sends

	has_many :is_colleague_of
	has_many :users, :through => :is_colleague_of

	has_many :works_on
	has_many :tasks, :through => :works_on

	has_many :comments_on
	has_many :projects, :through => :comments_on

	has_many :collaborates
	has_many :projects, :through => :collaborates

	has_many :follows
	has_many :projects, :through => :follows

	has_many :has_skill
	has_many :skills, :through => :has_skill

scope :alphasort, lambda { order("users.first_name ASC") }

	EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i
	validates :email, :presence => true,
                    :length => { :maximum => 100 },
                    :format => EMAIL_REGEX,
                    :confirmation => true
end
