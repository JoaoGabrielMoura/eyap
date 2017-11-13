class ProjectCriteriaController < ApplicationController
  before_action :set_project_criterium, only: [:show, :edit, :update, :destroy]

  # GET /project_criteria
  # GET /project_criteria.json
  def index
    @project_criteria = ProjectCriterium.all
  end

  # GET /project_criteria/1
  # GET /project_criteria/1.json
  def show
  end

  # GET /project_criteria/new
  def new
    @project_criterium = ProjectCriterium.new
  end

  # GET /project_criteria/1/edit
  def edit
  end

  # POST /project_criteria
  # POST /project_criteria.json
  def create
    @project_criterium = ProjectCriterium.new(project_criterium_params)

    respond_to do |format|
      if @project_criterium.save
        format.html { redirect_to @project_criterium, notice: 'Project criterium was successfully created.' }
        format.json { render :show, status: :created, location: @project_criterium }
      else
        format.html { render :new }
        format.json { render json: @project_criterium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /project_criteria/1
  # PATCH/PUT /project_criteria/1.json
  def update
    respond_to do |format|
      if @project_criterium.update(project_criterium_params)
        format.html { redirect_to @project_criterium, notice: 'Project criterium was successfully updated.' }
        format.json { render :show, status: :ok, location: @project_criterium }
      else
        format.html { render :edit }
        format.json { render json: @project_criterium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_criteria/1
  # DELETE /project_criteria/1.json
  def destroy
    @project_criterium.destroy
    respond_to do |format|
      format.html { redirect_to project_criteria_url, notice: 'Project criterium was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_criterium
      @project_criterium = ProjectCriterium.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_criterium_params
      params.require(:project_criterium).permit(:name, :value)
    end
end
