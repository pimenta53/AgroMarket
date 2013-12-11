class Admin::Academy::TutorialsController < ApplicationController
	layout "admin"
	before_action :set_academy_tutorial, only: [:show, :edit, :update, :destroy]
	before_action :set_premission

	def index
		@aproved_tutorials = Academy::Tutorial.all
	end

	def show 
		
	end

	def aprove_tutorial
		tutorial = Academy::Tutorial.find(params[:id_aprove])
		tutorial.aproved = 1
		tutorial.save

		redirect_to admin_dashboard_index_path,:notice => "Tutorial foi aprovado com sucesso"
	end

	private
	    # Use callbacks to share common setup or constraints between actions.
	    def set_academy_tutorial
	      @academy_tutorial = Academy::Tutorial.find(params[:id])
	      @categories = Category.all
	    end

	    # Never trust parameters from the scary internet, only allow the white list through.
	    def academy_tutorial_params
	      params.require(:academy_tutorial).permit(:category_id,:rapid_description, :user_id, :aproved, :title, :text, :is_delected)
	    end


	  	def set_premission
	  		if current_user.nil?
	  			redirect_to root_path
	  		else
	  			if !current_user.user_type.nil?
			  		if current_user.user_type == 1
			  			redirect_to ads_path, :notice => "Boa sorte, não consegues entrar porque não és ADMIN, se quiseres pede ao LIMA"
			  		end
			  	end
		  	end
	  	end

end