class User < ActiveRecord::Base
	has_many :books
	#mount_uploader :user_image, File3Uploader
	acts_as_voter
	acts_as_messageable

	def name
		"User #{id}"
	end
	#tell mailboxer what colum i have my email named
	def mailboxer_email(object)
	  email
	end

	#has_one :book
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  
end
