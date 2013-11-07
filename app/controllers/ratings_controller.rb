class RatingsController < ApplicationController
	before_action :set_rating, only: [:show,:update]

	def index
		@rating = Rating.where(:rater_id => current_user.id,:rate => nil)
	end

	def show
	end

	def create
		@rating = Rating.new(rating_params)

	end

	def update
		@rating.update(rating_params)
		flash[:notice] = "Rating atribuído com sucesso"
		redirect_to root_path
	end

	private
		def rating_params
      		params.require(:rating).permit(:comment,:rate)
		end

		def set_rating
			@rating = Rating.find(params[:id])
		end


end
