class Book < ActiveRecord::Base
	belongs_to :user
	belongs_to :category
	has_many :resources
	mount_uploader :my_file, FileUploader

	validates :title, :description, :address, :presence => true
	# can also be an IP address
	geocoded_by :address   
	# auto-fetch coordinates # would normally update everytime the model is but now only does when address is changed
	after_validation :geocode, :if => :address_changed?        
	#is_impressionable :counter_cache => true, :column_name => :page_count, :unique => :true
	is_impressionable :counter_cache => true, :column_name => :page_count, :unique => :request_hash

	acts_as_votable

  #has_attached_file :book_img, styles: { book_index: "300x300>", book_show: "100x100>" }, default_url: "/images/:style/missing.png"
  #validates_attachment_content_type :book_img, content_type: /\Aimage\/.*\z/

  #validates :title, :description, :presence => true
  #alidates :title, :length => { :minimum => 6 }
  #validates :title, :uniqueness => true

 #validates :title, :description, presence: true

#validates :title, presence: true, length: { minimum: 3, maximum: 25 }
end
