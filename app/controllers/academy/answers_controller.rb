#encoding: utf-8
class Academy::AnswersController < ApplicationController
  before_action :set_academy_answer, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource :only => [:edit,:update,:new, :destroy]

  # GET /academy/answers
  # GET /academy/answers.json
  def index
    @academy_answers = Academy::Answer.all
  end

  # GET /academy/answers/1
  # GET /academy/answers/1.json
  def show
  end

  # GET /academy/answers/new
  def new
    @academy_answer = Academy::Answer.new
  end

  # GET /academy/answers/1/edit
  def edit
    @academy_question = @academy_answer.question
  end

  # POST /academy/answers
  # POST /academy/answers.json
  def create
    @academy_answer = Academy::Answer.new(academy_answer_params)

    question_id = params[:academy_answer][:question_id]

    if @academy_answer.save
      # create a notifications for the user that made the question, if one doesnt exist already
      if current_user.id != @academy_answer.question.user_id && Notification.where(:user_id => @academy_answer.question.user_id, :id_destination => @academy_answer.question.id, :notification_type => 4, :watched => false).empty?
        notify = Notification.new(:user_id => @academy_answer.question.user_id, :id_destination => @academy_answer.question.id)
        notify.set_type(:new_answer)
        notify.save
      end

      @answers = Academy::Answer.where(:question_id => question_id)
      render :partial => 'create.js.erb'
    end

  end

  # PATCH/PUT /academy/answers/1
  # PATCH/PUT /academy/answers/1.json
  def update
    respond_to do |format|
      if @academy_answer.update(academy_answer_params)
        format.html { redirect_to @academy_answer.question, notice: 'Answer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @academy_answer.question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /academy/answers/1
  # DELETE /academy/answers/1.json
  def destroy
    question = @academy_answer.question
    @academy_answer.destroy
    respond_to do |format|
      format.html { redirect_to academy_question_path(question) , notice: 'Answer was successfully deleted.'}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_academy_answer
      @academy_answer = Academy::Answer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def academy_answer_params
      params.require(:academy_answer).permit(:question_id, :user_id, :text)
    end
end
