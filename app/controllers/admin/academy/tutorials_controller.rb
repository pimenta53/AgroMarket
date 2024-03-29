#encoding: utf-8
class Admin::Academy::TutorialsController < Admin::ApplicationController
	before_action :set_academy_tutorial, only: [:show, :edit, :update, :destroy]

	def index
		@aproved_tutorials = Academy::Tutorial.aproved_tutorials
		@unaproved_tutorials = Academy::Tutorial.unaproved_tutorials
		@tutorials = Academy::Tutorial.all
		authorize! :read, @aproved_tutorials
	end

	def show

	end

	def edit

	end

	def aprove_tutorial
		tutorial = Academy::Tutorial.find(params[:id_aprove])
		tutorial.aproved = true
		tutorial.save

		#cria notificação
    Notification.create_notification( tutorial.user_id , tutorial.id , 6 , "Tutorial Aprovado")

		redirect_to admin_academy_tutorials_path,:notice => "Tutorial foi aprovado com sucesso"

		owner_user = User.find_by_id(tutorial.user_id)

		owner_user.followers.each do | user|

			feed = Feed.new
			feed.user_id = user.id
			feed.in = 3
			feed.id_content = tutorial.id
			feed.save

		end
	end


  def destroy
    #@academy_tutorial.destroy
    dest = @academy_tutorial.id
    type = 6 #aproved_tutorial_code
    Notification.clear_notifications(type,dest)
    @academy_tutorial.is_deleted = true
    @academy_tutorial.save
    respond_to do |format|
      format.html { redirect_to admin_academy_tutorials_url }
      format.json { head :no_content }
    end
  end

private
	    # Use callbacks to share common setup or constraints between actions.
	    def set_academy_tutorial
	    	@academy_tutorial = Academy::Tutorial.find(params[:id])
	    	@categories = Category.all
	    	authorize! :read, nil
	    end

	    # Never trust parameters from the scary internet, only allow the white list through.
	    def academy_tutorial_params
	    	params.require(:academy_tutorial).permit(:category_id,:rapid_description, :user_id, :aproved, :title, :text, :is_delected)
	    end

	end
