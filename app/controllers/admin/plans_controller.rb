class Admin::PlansController < Admin::ApplicationController
  before_action :set_admin_plan, only: [:show, :edit, :update, :destroy]

  # GET /admin/plans
  # GET /admin/plans.json
  def index
    @admin_plans = Plan.all

  end

  # GET /admin/plans/1
  # GET /admin/plans/1.json
  def show
  end

  # GET /admin/plans/new
  def new
    @admin_plan = Plan.new
  end

  # GET /admin/plans/1/edit
  def edit
  end

  # POST /admin/plans
  # POST /admin/plans.json
  def create
    @admin_plan = Plan.new(admin_plan_params)

    respond_to do |format|
      if @admin_plan.save
        format.html { redirect_to @admin_plans_path, notice: 'Pacote criado com sucesso.' }
        format.json { render action: 'show', status: :created, location: @admin_plan }
      else
        format.html { render action: 'new' }
        format.json { render json: @admin_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/plans/1
  # PATCH/PUT /admin/plans/1.json
  def update
    respond_to do |format|
      if @admin_plan.update(admin_plan_params)
        format.html { redirect_to @admin_plan, notice: 'Pacote editado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @admin_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/plans/1
  # DELETE /admin/plans/1.json
  def destroy
    @admin_plan.destroy
    respond_to do |format|
      format.html { redirect_to admin_plans_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_plan
      @admin_plan = Plan.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_plan_params
      params.require(:plan).permit(:name, :duration, :price, :ads_limit, :event_limit)
    end

end
