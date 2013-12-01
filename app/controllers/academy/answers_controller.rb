class Academy::AnswersController < ApplicationController
  before_action :set_academy_answer, only: [:show, :edit, :update, :destroy]

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
  end

  # POST /academy/answers
  # POST /academy/answers.json
  def create
    @academy_answer = Academy::Answer.new(academy_answer_params)

    respond_to do |format|
      if @academy_answer.save
        format.html { redirect_to @academy_answer, notice: 'Answer was successfully created.' }
        format.json { render action: 'show', status: :created, location: @academy_answer }
      else
        format.html { render action: 'new' }
        format.json { render json: @academy_answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /academy/answers/1
  # PATCH/PUT /academy/answers/1.json
  def update
    respond_to do |format|
      if @academy_answer.update(academy_answer_params)
        format.html { redirect_to @academy_answer, notice: 'Answer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @academy_answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /academy/answers/1
  # DELETE /academy/answers/1.json
  def destroy
    @academy_answer.destroy
    respond_to do |format|
      format.html { redirect_to academy_answers_url }
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
      params.require(:academy_answer).permit(:question_id, :user_id, :up, :down, :is_deleted, :image_url, :text)
    end
end
