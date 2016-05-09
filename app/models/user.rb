require 'data_mapper'
require_relative 'peeps'

class User
	include DataMapper::Resource

	# attr_accessor :password_digest

	property :id, Serial
	property :name, String
	property :email, String
	property :password, String

	has n, :peepss

	def self.authenticate(email, password)
		user = self.first(email: email, password: password)
		if user
			user
		else
			nil
		end
	end

	# def password=(password)
	# 	@password = password
 #    	self.password_digest = BCrypt::Password.create(password)
 #    end
end
