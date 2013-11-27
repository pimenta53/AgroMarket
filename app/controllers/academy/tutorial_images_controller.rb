class Academy::TutorialImagesController < ApplicationController
  before_action :set_academy_tutorial_image, only: [:show, :edit, :update, :destroy]

  # GET /academy/tutorial_images
  # GET /academy/tutorial_images.json
  def index
    @academy_tutorial_images = Academy::TutorialImage.all
  end

  # GET /academy/tutorial_images/1
  # GET /academy/tutorial_images/1.json
  def show
  end

  # GET /academy/tutorial_images/new
  def new
    @academy_tutorial_image = Academy::TutorialImage.new
  end

  # GET /academy/tutorial_images/1/edit
  def edit
  end

  # POST /academy/tutorial_images
  # POST /academy/tutorial_images.json
  def create
    @academy_tutorial_image = Academy::TutorialImage.new(academy_tutorial_image_params)

    respond_to do |format|
      if @academy_tutorial_image.save
        format.html { redirect_to @academy_tutorial_image, notice: 'Tutorial image was successfully created.' }
        format.json { render action: 'show', status: :created, location: @academy_tutorial_image }
      else
        format.html { render action: 'new' }
        format.json { render json: @academy_tutorial_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /academy/tutorial_images/1
  # PATCH/PUT /academy/tutorial_images/1.json
  def update
    respond_to do |format|
      if @academy_tutorial_image.update(academy_tutorial_image_params)
        format.html { redirect_to @academy_tutorial_image, notice: 'Tutorial image was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @academy_tutorial_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /academy/tutorial_images/1
  # DELETE /academy/tutorial_images/1.json
  def destroy
    @academy_tutorial_image.destroy
    respond_to do |format|
      format.html { redirect_to academy_tutorial_images_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_academy_tutorial_image
      @academy_tutorial_image = Academy::TutorialImage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def academy_tutorial_image_params
      params.require(:academy_tutorial_image).permit(:tutorial_id, :url, :is_deleted)
    end
end
