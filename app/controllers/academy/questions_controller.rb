#encoding: utf-8
class Academy::QuestionsController < ApplicationController
  before_action :set_academy_question, only: [:show, :edit, :update]
  before_action :get_categories
  load_and_authorize_resource :only => [:edit,:update,:destroy]

  # GET /academy/questions
  # GET /academy/questions.json
  def index
    if params[:page] != nil
       page = params[:page]
    else
       page = 1
    end

    if params[:search] != nil
      academy_questions = Academy::Question.arel_table

      search_table = academy_questions[:is_deleted].eq(false)


      search_table_title = nil
      #search_table_description = nil

      params[:search].each { |parameter|
        if (search_table_title != nil)
          search_table_title = search_table_title.or(academy_questions[:category_id].matches("#{parameter}".split(":")[1]))
          #search_table_description  = search_table_description.and(academy_tutorials[:rapid_description].matches("%#{parameter}%"))
          
        else
          search_table_title = academy_questions[:category_id].matches("#{parameter}".split(":")[1])
          #search_table_description  = academy_tutorials[:rapid_description].matches("%#{parameter}%")
          
        end
      }
      @academy_questions = Academy::Question.where(search_table.and(search_table_title)).paginate(:page => page, :per_page => 8)
    else 
      @academy_questions = Academy::Question.where(:is_deleted => 0).paginate(:page => page, :per_page => 8)
      

    end

    @categories = Category.all
    @cities = City.order('city ASC').all

  end

  # GET /academy/questions/1
  # GET /academy/questions/1.json
  def show
    #@answers = Academy::Answer.where(:question_id => @academy_question.id)

    #mark notification as watched, if params[:notification] is set
    if params.has_key?(:notification) && (Integer(params[:notification]) rescue nil)
      Notification.find(params[:notification]).update(:watched => true)
    end

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

        current_user.followers.each do | user|

          feed = Feed.new
          feed.user_id = user.id
          feed.in = 2
          feed.id_content = @academy_question.id
          feed.save

        end
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
