class UsersController < ApplicationController
		before_action :is_good_user?
	def show
		@user = User.find(params[:id])
	end

		def is_good_user?
	    if current_user != nil
	    	unless current_user.id == params[:id]
	    		redirect_to user_path(params[:id])
	    	end
	    else
	    	redirect_to root_path
	    end
	end
end
