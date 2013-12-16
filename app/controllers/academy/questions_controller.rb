#encoding: utf-8
class Academy::QuestionsController < ApplicationController
  before_action :set_academy_question, only: [:show, :edit, :update]
  before_action :get_categories
  load_and_authorize_resource :only => [:edit,:update,:new,:destroy]
  # GET /academy/questions
  # GET /academy/questions.json
  def index
    @academy_questions = Academy::Question.search(params[:query],params[:category_id])#.where(:is_deleted => false)
  end

  # GET /academy/questions/1
  # GET /academy/questions/1.json
  def show
    #@answers = Academy::Answer.where(:question_id => @academy_question.id)
    @academy_answer = Academy::Answer.new
    @best_answer = @academy_question.best_answer
  end

  # GET /academy/questions/new
  def new
    @academy_question = Academy::Question.new
  end

  # GET /academy/questions/1/edit
  def edit

  end

  # POST /academy/questions
  # POST /academy/questions.json
  def create
    @academy_question = Academy::Question.new(academy_question_params)

    respond_to do |format|
      if @academy_question.save
        format.html { redirect_to @academy_question, notice: 'Question was successfully created.' }
        format.json { render action: 'show', status: :created, location: @academy_question }
      else
        format.html { render action: 'new' }
        format.json { render json: @academy_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /academy/questions/1
  # PATCH/PUT /academy/questions/1.json
  def update
    respond_to do |format|
      if @academy_question.update(academy_question_params)
        format.html { redirect_to @academy_question, notice: 'Question was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @academy_question.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    a = Academy::Question.find(params[:id].split('-')[0])
    a.update(:is_deleted => true)
    a.save
    redirect_to academy_questions_path
  end

  def get_categories
    @categories = Category.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_academy_question
      @academy_question = Academy::Question.includes(:answers).find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def academy_question_params
      params.require(:academy_question).permit(:user_id, :category_id, :title, :text, :image_url)
    end

end
