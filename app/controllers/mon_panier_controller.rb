class MonPanierController < ApplicationController
	before_action :is_good_user?
	def index
		@carts = Cart.where(user_id: current_user.id)
	end
	def is_good_user?
		unless user_signed_in?
			redirect_to root_path
		end
	end
end
