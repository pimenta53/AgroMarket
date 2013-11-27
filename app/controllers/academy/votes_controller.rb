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

  # DELETE /academy/votes/1
  # DELETE /academy/votes/1.json
  def destroy
    @academy_vote.destroy
    respond_to do |format|
      format.html { redirect_to academy_votes_url }
      format.json { head :no_content }
    end
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
