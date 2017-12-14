module ApplicationHelper

	def org_count
		@app_books_count
	end

	def display_my_html(organization, opts={})
		if organization == 999
			name = 'Reach user'
		else	
		  theid = organization.id
		  name = organization.email.upcase
		  html_class = opts.key?(:html_class) ? opts[:html_class] : "normal"
	  	end
	  render "shared/chatbot", name: name, theid: theid, html_class: html_class
	end
	def get_res_by_bookid(book_id_in)
		@app_resource = Resource.where(["book_id = ?", book_id_in])
		return @app_resource
	end
end
