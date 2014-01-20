class Admin::Academy::QuestionsController < Admin::ApplicationController
  before_action :set_admin_academy_question, only: [:show, :edit, :update, :destroy]

  # GET /admin/academy/questions
  # GET /admin/academy/questions.json
  def index
    @admin_academy_questions = Academy::Question.all
  end

  # GET /admin/academy/questions/1
  # GET /admin/academy/questions/1.json
  def show
  end

  # GET /admin/academy/questions/new
  def new
    @admin_academy_question = Academy::Question.new
  end

  # GET /admin/academy/questions/1/edit
  def edit
  end

  # POST /admin/academy/questions
  # POST /admin/academy/questions.json
  def create
    @admin_academy_question = Academy::Question.new(admin_academy_question_params)

    respond_to do |format|
      if @admin_academy_question.save
        format.html { redirect_to @admin_academy_question, notice: 'Question was successfully created.' }
        format.json { render action: 'show', status: :created, location: @admin_academy_question }
      else
        format.html { render action: 'new' }
        format.json { render json: @admin_academy_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/academy/questions/1
  # PATCH/PUT /admin/academy/questions/1.json
  def update
    respond_to do |format|
      if @admin_academy_question.update(admin_academy_question_params)
        format.html { redirect_to @admin_academy_question, notice: 'Question was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @admin_academy_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/academy/questions/1
  # DELETE /admin/academy/questions/1.json
  def destroy
    #@admin_academy_question.destroy
    a = Academy::Question.find(params[:id].split('-')[0])
    a.update(:is_deleted => true)
    dest = a.id
    type = 4 #answer_question_code
    Notification.clear_notifications(type,dest)
    a.save

    respond_to do |format|
      format.html { redirect_to admin_academy_questions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_academy_question
      @admin_academy_question = Academy::Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_academy_question_params
      params[:admin_academy_question]
    end
end
