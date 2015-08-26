class User < ActiveRecord::Base
	has_many :textbooks
	before_save { self.email = email.downcase }
	before_create :create_remember_token

	validates :name, presence: true, length: { maximum: 50 }
	VALID_EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
	# VALID_PHONE_REGEX = /\d[0-9]\)*\z/
	validates 	:email, presence: true, 
				format: { with: VALID_EMAIL_REGEX }, 
				uniqueness: { case_sensitive: false }
=begin
	validates 	:phone, 
				allow_blank: true,
                format: { with: VALID_PHONE_REGEX },
                length: { minimum: 10, maximum: 15 }
=end
	has_secure_password
	validates :password, length: { minimum: 6 }


	def User.new_remember_token
		SecureRandom.urlsafe_base64
	end

	def User.digest(token)
		Digest::SHA1.hexdigest(token.to_s)
	end



	private



	def create_remember_token
		self.remember_token = User.digest(User.new_remember_token)
	end
end
