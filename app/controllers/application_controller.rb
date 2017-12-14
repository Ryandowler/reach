# CHANGE - tidy up and change variable names
class ApplicationController < ActionController::Base
  require 'uri'
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # this makes it that i can use an instance variable in application.html.rb
  before_filter :get_books

  private   
  def get_books
		#@app_books = Book.where(:category_id => @category_id).order("created_at DESC")
		#@app_books2 = Book.where(["user_id = ?", params[:id]])
	
    if user_signed_in?
      #get the orgs belloning to the user
      @users_books = Book.where(["user_id = ?", current_user.id])
      #take first 3 of these orgs
      @app_books3 = @users_books.take(3)
      #count the total amount of orgs bellonging to the user
      @app_books_count = @users_books.count
      @user = current_user
    end
  end
end
