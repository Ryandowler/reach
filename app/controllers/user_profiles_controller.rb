class UserProfilesController < ApplicationController
  def show
  	#dont need this line below becasue its now in the application controller :)
  	#@user = User.find(params[:id])
  	if user_signed_in?
  		@user_orgs = @user.books
  	end
  end
end
