class Academy::VotesController < ApplicationController
  before_action :set_academy_vote, only: [:show, :edit, :update, :destroy]

  # GET /academy/votes
  # GET /academy/votes.json
  def index
    @academy_votes = Academy::Vote.all
  end

  # GET /academy/votes/1
  # GET /academy/votes/1.json
  def show
  end

  # GET /academy/votes/new
  def new
    @academy_vote = Academy::Vote.new
  end

  # GET /academy/votes/1/edit
  def edit
  end

  # POST /academy/votes
  # POST /academy/votes.json
  def create
    @academy_vote = Academy::Vote.new(academy_vote_params)

    respond_to do |format|
      if @academy_vote.save
        format.html { redirect_to @academy_vote, notice: 'Vote was successfully created.' }
        format.json { render action: 'show', status: :created, location: @academy_vote }
      else
        format.html { render action: 'new' }
        format.json { render json: @academy_vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /academy/votes/1
  # PATCH/PUT /academy/votes/1.json
  def update
    respond_to do |format|
      if @academy_vote.update(academy_vote_params)
        format.html { redirect_to @academy_vote, notice: 'Vote was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @academy_vote.errors, status: :unprocessable_entity }
      end
    end
  end




  def up_vote
    answer = Academy::Answer.find(params[:answer])
    vote = Academy::Vote.where(:user_id => current_user.id, :answer_id => answer.id)

    if vote.empty?
      answer.vote_up
      vote = Academy::Vote.new(:vote => 1, :user_id => current_user.id, :answer_id => answer.id)
      vote.save
    elsif vote.first.vote == -1
      answer.vote_up_from_down
      Academy::Vote.update_votes( current_user.id, answer.id, 1)
    end
    redirect_to answer.question
  end

  def down_vote
    answer = Academy::Answer.find(params[:answer])

    vote = Academy::Vote.where(:user_id => current_user.id, :answer_id => answer.id)

    if vote.empty?
      answer.vote_down
      vote = Academy::Vote.new(:vote => -1, :user_id => current_user.id, :answer_id => answer.id)
      vote.save
    elsif vote.first.vote == 1
      answer.vote_down_from_up
      Academy::Vote.update_votes( current_user.id, answer.id, -1)
    end
    redirect_to answer.question
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_academy_vote
      @academy_vote = Academy::Vote.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def academy_vote_params
      params.require(:academy_vote).permit(:vote, :user_id, :answer_id)
    end
end
