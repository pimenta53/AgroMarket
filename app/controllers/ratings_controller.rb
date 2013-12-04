#encoding: utf-8
class RatingsController < ApplicationController
	before_action :set_rating, only: [:show,:update,:edit]

	def new
		@rating = Rating.new
	end

	def edit

	end

	def index
		@rating = Rating.where(:rater_id => current_user.id,:rate => nil)
		@myrate = Rating.where(:rated_id => current_user.id).average(:rate)
		rate_perc = @myrate.to_f - @myrate.to_i
		#Value when image init and end - 20 is image size
		@rate_perc_init = rate_perc * 20
	end

	def show
	end

	def create
		@rating = Rating.new(rating_params)

	end

	def update
		@rating.update(rating_params)
		flash[:notice] = "Rating atribuído com sucesso"
		redirect_to root_path,notice: 'Rating Atribuido com sucesso' 
	end

	private
		def rating_params
      		params.require(:rating).permit(:comment,:rate)
		end

		def set_rating
			@rating = Rating.find(params[:id])
		end


end
