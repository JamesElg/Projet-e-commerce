class Admin::DashboardController < ApplicationController
	before_action :is_admin?

	def index

	end

	private

	def is_admin?
	    #A moins que le user ne soit un admin, on le redirige vers l'accueil
	    if current_user != nil
	    	unless current_user.is_admin? == true 
	    		redirect_to root_path
	    	end
	    else
	    	redirect_to root_path
	    end
	end
end
