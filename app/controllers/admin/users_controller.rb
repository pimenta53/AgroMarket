#encoding: utf-8
class Admin::UsersController < Admin::ApplicationController
  before_action :set_admin_user, only: [:show, :edit, :update, :destroy]
  before_action :load_stuff_ads, only: [:new,:create,:show,:edit,:update]

  # GET /admin/users
  # GET /admin/users.json
  def index
    @admin_users = User.all
    @cities = City.all
    @plans = Plan.all
  end

  # GET /admin/users/1
  # GET /admin/users/1.json
  def show
  end

  # GET /admin/users/new
  def new
    @admin_user = User.new
  end

  # GET /admin/users/1/edit
  def edit
  end

  # POST /admin/users
  # POST /admin/users.json
  def create
    @admin_user = User.new(admin_user_params)

    respond_to do |format|
      if @admin_user.save
        format.html { redirect_to [:admin,@admin_user], notice: 'User was successfully created.' }
        format.json { render action: 'show', status: :created, location: @admin_user }
      else
        format.html { render action: 'new' }
        format.json { render json: @admin_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/users/1
  # PATCH/PUT /admin/users/1.json
  def update
    respond_to do |format|
      if @admin_user.update(admin_user_params)
        format.html { redirect_to [:admin,@admin_user], notice: 'Utilizador actualizado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @admin_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/users/1
  # DELETE /admin/users/1.json
  def destroy
   # @admin_user.destroy
   @admin_user.deleted = true
   @admin_user.save
    respond_to do |format|
      format.html { redirect_to admin_users_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_user
      @admin_user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_user_params
      #params[:admin_user]
      params.require(:user).permit(:name, :username, :city_id,:password, :password_confirmation, :email, :phone, :ocupation, :user_type)
    end

    def load_stuff_ads
      @cities = City.all
    end


end
