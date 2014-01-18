class Admin::Academy::WorkshopsController < Admin::ApplicationController
  before_action :set_admin_academy_workshop, only: [:show, :edit, :update, :destroy]

  # GET /admin/academy/workshops
  # GET /admin/academy/workshops.json
  def index
    @admin_academy_workshops = Academy::Workshop.all
    @aproved_workshops = Academy::Workshop.aproved_workshops
    @unaproved_workshops = Academy::Workshop.unaproved_workshops

  end

  # GET /admin/academy/workshops/1
  # GET /admin/academy/workshops/1.json
  def show
  end

  # GET /admin/academy/workshops/new
  def new
    @admin_academy_workshop = Academy::Workshop.new
  end

  # GET /admin/academy/workshops/1/edit
  def edit
  end


  def aprove_workshop
    workshop = Academy::Workshop.find(params[:id_aprove])
    workshop.is_aproved = true
    workshop.save

    #cria notificação
    Notification.create_notification( current_user , event.id , 8 , "Workshop Aprovado")

    redirect_to admin_academy_workshops_path,:notice => "Workshop foi aprovado com sucesso"
    owner_user = User.find_by_id(workshop.user_id)

    owner_user.followers.each do | user|

          feed = Feed.new(params[:feed])
          feed.user_id = user.id
          feed.in = 5
          feed.id_content = workshop.id
          feed.save

    end
  end


    def unaprove_workshop
    workshop = Academy::Workshop.find(params[:id_aprove])
    workshop.is_aproved = false
    workshop.save


    redirect_to admin_academy_workshops_path,:notice => "Workshop foi desaprovado com sucesso"
  end


  # POST /admin/academy/workshops
  # POST /admin/academy/workshops.json
  def create
    @admin_academy_workshop = Academy::Workshop.new(admin_academy_workshop_params)

    respond_to do |format|
      if @admin_academy_workshop.save
        format.html { redirect_to @admin_academy_workshop, notice: 'Workshop was successfully created.' }
        format.json { render action: 'show', status: :created, location: @admin_academy_workshop }
      else
        format.html { render action: 'new' }
        format.json { render json: @admin_academy_workshop.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/academy/workshops/1
  # PATCH/PUT /admin/academy/workshops/1.json
  def update
    respond_to do |format|
      if @admin_academy_workshop.update(admin_academy_workshop_params)
        format.html { redirect_to @admin_academy_workshop, notice: 'Workshop was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @admin_academy_workshop.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/academy/workshops/1
  # DELETE /admin/academy/workshops/1.json
  def destroy
    #@academy_workshop.destroy
    @admin_academy_workshop.is_deleted=true
    @admin_academy_workshop.save
    respond_to do |format|
      format.html { redirect_to admin_academy_workshops_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_academy_workshop
      @admin_academy_workshop = Academy::Workshop.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_academy_workshop_params
      params[:admin_academy_workshop]
    end
end
