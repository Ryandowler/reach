module ResourcesHelper
	def get_org_by_id(the_id)
	 bookss = Book.find(the_id)
	 return bookss
	 #puts the_id
	end
end
