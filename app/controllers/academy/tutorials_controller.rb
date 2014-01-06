#encoding: utf-8
class Academy::TutorialsController < ApplicationController
  before_action :set_academy_tutorial, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource :only => [:edit,:update,:show]


  # GET /academy/tutorials
  # GET /academy/tutorials.json
  def index
    #@academy_tutorials = Academy::Tutorial.all





#################################################

    if params[:search] != nil
      academy_tutorials = Academy::Tutorial.arel_table

      search_table = academy_tutorials[:aproved].eq(true)


      search_table_title = nil
      #search_table_description = nil

      params[:search].each { |parameter|
        if (search_table_title != nil)
          search_table_title = search_table_title.or(academy_tutorials[:category_id].matches("#{parameter}".split(":")[1]))
          #search_table_description  = search_table_description.and(academy_tutorials[:rapid_description].matches("%#{parameter}%"))
          
        else
          search_table_title = academy_tutorials[:category_id].matches("#{parameter}".split(":")[1])
          #search_table_description  = academy_tutorials[:rapid_description].matches("%#{parameter}%")
          
        end
      }
      @academy_tutorials = Academy::Tutorial.where(search_table.and(search_table_title)) #.paginate(:page => page, :per_page => 8)
    else 
      @academy_tutorials = Academy::Tutorial.where(:aproved => 1) #.paginate(:page => page, :per_page => 8)
      
    end

    @categories = Category.all
    @cities = City.order('city ASC').all


  end

  # GET /academy/tutorials/1
  # GET /academy/tutorials/1.json
  def show
  end

  # GET /academy/tutorials/new
  def new
    @academy_tutorial = Academy::Tutorial.new
    @categories = Category.all

  end

  # GET /academy/tutorials/1/edit
  def edit

  end

  # POST /academy/tutorials
  # POST /academy/tutorials.json
  def create
    @academy_tutorial = Academy::Tutorial.new(academy_tutorial_params)

    respond_to do |format|
      if @academy_tutorial.save
        format.html { redirect_to @academy_tutorial, notice: 'Tutorial was successfully created.' }
        format.json { render action: 'show', status: :created, location: @academy_tutorial }
      else
        format.html { render action: 'new' }
        format.json { render json: @academy_tutorial.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /academy/tutorials/1
  # PATCH/PUT /academy/tutorials/1.json
  def update
    respond_to do |format|
      if @academy_tutorial.update(academy_tutorial_params)
        format.html { redirect_to @academy_tutorial, notice: 'Tutorial was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @academy_tutorial.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /academy/tutorials/1
  # DELETE /academy/tutorials/1.json
  def destroy
    @academy_tutorial.destroy
    respond_to do |format|
      format.html { redirect_to academy_tutorials_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_academy_tutorial
      @academy_tutorial = Academy::Tutorial.find(params[:id])
      @categories = Category.all
      @cities = City.order('city ASC').all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def academy_tutorial_params
      params.require(:academy_tutorial).permit(:category_id,:rapid_description, :user_id, :aproved, :title, :text, :is_delected)
    end
end
