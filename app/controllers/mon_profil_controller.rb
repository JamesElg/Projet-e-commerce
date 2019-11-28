class MonProfilController < ApplicationController
	before_action :is_good_user?
	def index

	end
	def is_good_user?
		unless user_signed_in?
			redirect_to root_path
		end
	end
end
