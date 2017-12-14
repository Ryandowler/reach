class Resource < ActiveRecord::Base
	belongs_to :book
	mount_uploader :image_file, File2Uploader

	#validate :thing_count_within_limit, :on => :create


	# def thing_count_within_limit
	# 	if book.resources(:reload).count >= 2
	# 	  errors.add(:base, "Exceeded thing limit")
	# 	end
	# end
end
