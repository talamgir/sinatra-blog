class User < ActiveRecord::Base
	has_many :posts

	def isSecurePassword
		!self.password.nil? &&
		self.password.length > 5 &&
		!self.password.match("[0-9]").nil?
	end

	def isGoodUsername
		!self.username.nil? &&
		self.username.length > 5
	end
end


class Post < ActiveRecord::Base
	belongs_to :user

	def aPost
		!self.content.nil? &&
		self.content.length < 150
	end
end

# class Profile < ActiveRecord::Base
# 	has_many :posts
# 	belongs_to :user

# 	def aProfile
# 		!self.aboutme.nil? &&
# 		self.aboutme.length < 300
# 	end
# end

